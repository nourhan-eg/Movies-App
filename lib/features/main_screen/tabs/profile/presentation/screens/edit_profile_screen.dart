import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/widgets/app_avatars.dart';
import 'package:movies/features/main_screen/tabs/profile/domain/entities/user_profile_entity.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/bloc/edit_profile_bloc/edit_profile_event.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/bloc/edit_profile_bloc/edit_profile_state.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/bloc/user_profile_bloc/profile_bloc.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/bloc/user_profile_bloc/profile_event.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/widgets/avatar_picker_sheet.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/widgets/edit_profile_actions.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/widgets/edit_profile_avatar.dart';
import 'package:movies/features/main_screen/tabs/profile/presentation/widgets/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  final UserProfileEntity user;

  const EditProfileScreen({super.key, required this.user});

  static void open(BuildContext context, UserProfileEntity user) {
    final profileBloc = context.read<ProfileBloc>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt<EditProfileBloc>()),
            BlocProvider.value(value: profileBloc),
          ],
          child: EditProfileScreen(user: user),
        ),
      ),
    );
  }

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late String _selectedAvatar;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _phoneController = TextEditingController(text: widget.user.phone ?? '');
    _selectedAvatar = AppAvatars.resolve(widget.user.photoUrl);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _pickAvatar() async {
    final picked = await AvatarPickerSheet.show(context, _selectedAvatar);
    if (picked != null && mounted) {
      setState(() => _selectedAvatar = picked);
    }
  }

  void _onUpdate() {
    if (_formKey.currentState!.validate()) {
      context.read<EditProfileBloc>().add(
            UpdateProfileRequested(
              name: _nameController.text.trim(),
              phone: _phoneController.text.trim(),
              avatar: _selectedAvatar,
            ),
          );
    }
  }

  void _onDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.darkGrey,
        title: const Text(
          'Delete Account',
          style: TextStyle(color: AppColors.white),
        ),
        content: const Text(
          'This action is permanent and cannot be undone.',
          style: TextStyle(color: AppColors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.white),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text(
              'Delete',
              style: TextStyle(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) {
      context.read<EditProfileBloc>().add(DeleteAccountRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileUpdateSuccess) {
          context.read<ProfileBloc>().add(LoadProfile());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated'),
              backgroundColor: AppColors.green,
            ),
          );
          Navigator.of(context).pop();
        } else if (state is EditProfileDeleteSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.login,
            (_) => false,
          );
        } else if (state is EditProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          backgroundColor: AppColors.dark,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_rounded, color: AppColors.yellow),
          ),
          centerTitle: true,
          title: Text(
            'Pick Avatar',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.yellow),
          ),
        ),
        body: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
            final isLoading = state is EditProfileLoading;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    EditProfileAvatar(
                      avatarPath: _selectedAvatar,
                      onTap: _pickAvatar,
                    ),
                    const SizedBox(height: 32),
                    EditProfileForm(
                      nameController: _nameController,
                      phoneController: _phoneController,
                    ),
                    const SizedBox(height: 250),
                    EditProfileActions(
                      isLoading: isLoading,
                      onDelete: _onDelete,
                      onUpdate: _onUpdate,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
