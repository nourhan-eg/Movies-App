import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_icons.dart';
import 'package:movies/core/app_images.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/app_texts.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/core/widgets/custom_snack_bar.dart';
import 'package:movies/core/widgets/custom_text_field.dart';
import 'package:movies/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:movies/features/auth/login/presentation/bloc/login_events.dart';
import 'package:movies/features/auth/login/presentation/bloc/login_states.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login route";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginStates>(
          builder: (BuildContext context, LoginStates state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(AppImages.moviesLogo),
                    CustomTextField(
                      controller: _emailController,
                      prefixIcon: AppIcons.emailIcon,
                      hintText: AppTexts.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 22),
                    CustomTextField(
                      controller: _passwordController,
                      prefixIcon: AppIcons.passwordIcon,
                      hintText: AppTexts.password,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: .end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.forgetPassword);
                          },
                          child: Text(
                            AppTexts.forgetYourPassword,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                              color: AppColors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    CustomButton(
                      text: AppTexts.login,
                      isLoading: state is LoginLoading,
                      onPressed: state is LoginLoading
                          ? () {}
                          : () {
                              context.read<LoginBloc>().add(
                                    LoginWithEmailRequested(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                    ),
                                  );
                            },
                      backgroundColor: AppColors.yellow,
                      textColor: AppColors.black,
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          AppTexts.dontHaveAccount,
                          style: Theme
                              .of(
                            context,
                          )
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: AppColors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.register);
                          },
                          child: Text(
                            AppTexts.createOne,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                              color: AppColors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        SizedBox(
                          width: 92,
                          child: Divider(color: AppColors.yellow, thickness: 1),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            AppTexts.or,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                              color: AppColors.yellow,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 92,
                          child: Divider(color: AppColors.yellow, thickness: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 28),
                    CustomButton(
                      text: AppTexts.loginWithGoogle,
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginWithGoogleRequested());
                      },
                      backgroundColor: AppColors.yellow,
                      textColor: AppColors.black,
                      icon: AppIcons.googleIcon,
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(context, AppRoutes.main);
            } else if (state is LoginFailure) {
              CustomSnackBar.showError(context, state.message);
            }
          },

      ),
    );
  }
}
