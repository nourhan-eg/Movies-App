import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_icons.dart';
import 'package:movies/core/app_images.dart';
import 'package:movies/core/app_texts.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/validator.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/core/widgets/custom_snack_bar.dart';
import 'package:movies/core/widgets/custom_text_field.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordBloc>(),
      child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            CustomSnackBar.showSuccess(context, AppTexts.resetPasswordSuccess);
            Navigator.pop(context);
          } else if (state is ForgetPasswordFailure) {
            CustomSnackBar.showError(context, state.message);
          }
        },
        builder: (context, state) {
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
                AppTexts.forgetPassword,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
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
                      hintText: AppTexts.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: AppTexts.verifyEmail,
                      isLoading: state is ForgetPasswordLoading,
                      onPressed: state is ForgetPasswordLoading
                          ? () {}
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<ForgetPasswordBloc>().add(
                                      ResetPasswordRequested(
                                        email: _emailController.text.trim(),
                                      ),
                                    );
                              }
                            },
                      backgroundColor: AppColors.yellow,
                      textColor: AppColors.black,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}