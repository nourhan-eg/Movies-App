import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_icons.dart';
import 'package:movies/core/app_images.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/core/widgets/custom_text_field.dart';
import 'package:movies/features/auth/forget_password/data/data_sources/forget_password_remote_data_source_impl.dart';
import 'package:movies/features/auth/forget_password/data/repositories/forget_password_repository_impl.dart';
import 'package:movies/features/auth/forget_password/domain/usecases/forget_password_usecase.dart';
import 'package:movies/features/auth/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:movies/features/auth/forget_password/presentation/bloc/forget_password_events.dart';
import 'package:movies/features/auth/forget_password/presentation/bloc/forget_password_states.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "forget password route";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final repository = ForgetPasswordRepositoryImpl(
          forgetPasswordRemoteDataSource: ForgetPasswordRemoteDataSourceImpl(
            firebaseAuth: FirebaseAuth.instance,
          ),
        );
        return ForgetPasswordBloc(
          forgetPasswordUsecase: ForgetPasswordUsecase(
            forgetPasswordRepository: repository,
          ),
        );
      },
      child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset email sent successfully! Please check your inbox.'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          } else if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is ForgetPasswordLoading;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.dark,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: AppColors.yellow,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Forget Password",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Image.asset(
                    AppImages.forgetPassword,
                    height: 220,
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    controller: _emailController,
                    prefixIcon: AppIcons.emailIcon,
                    hintText: "Email",
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  isLoading
                      ? const CircularProgressIndicator(color: AppColors.yellow)
                      : CustomButton(
                          text: "Verify Email",
                          onPressed: () {
                            context.read<ForgetPasswordBloc>().add(
                                  ResetPasswordRequested(
                                    email: _emailController.text,
                                  ),
                                );
                          },
                          backgroundColor: AppColors.yellow,
                          textColor: AppColors.black,
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}