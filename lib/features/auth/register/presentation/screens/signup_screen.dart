import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/di/di.dart';
import 'package:movies/core/validator.dart';
import 'package:movies/core/widgets/app_avatars.dart';
import 'package:movies/features/auth/register/presentation/bloc/signup_bloc.dart';
import 'package:movies/features/auth/register/presentation/bloc/signup_states.dart';

import '../../../../../core/app_icons.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../bloc/signup_events.dart';
import '../widgets/signup_avatar.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register route";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedAvatar = AppAvatars.beardMan;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignupBloc>(),
      child: BlocConsumer<SignupBloc, SignupStates>(
        builder: (BuildContext context, SignupStates state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.dark,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded, color: AppColors.yellow),
              ),
              centerTitle: true,
              title: Text(
                "Register",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.yellow),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SignUpAvatars(
                      onAvatarSelected: (path) =>
                        _selectedAvatar = path,
                      ),

                    SizedBox(height: 24),
                    CustomTextField(
                      controller: _nameController,
                      prefixIcon: AppIcons.nameIcon,
                      hintText: "Name",
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      validator: Validators.name,
                    ),
                    SizedBox(height: 24),
                    CustomTextField(
                      controller: _emailController,
                      prefixIcon: AppIcons.emailIcon,
                      hintText: "Email",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                    ),
                    SizedBox(height: 24),
                    CustomTextField(
                      controller: _passwordController,
                      prefixIcon: AppIcons.passwordIcon,
                      hintText: "password",
                      obscureText: true,
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validators.password,
                    ),
                    SizedBox(height: 24),
                    CustomTextField(
                      controller: _confirmPasswordController,
                      prefixIcon: AppIcons.passwordIcon,
                      hintText: "Confirm Password",
                      isPassword: true,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validators.password,
                    ),
                    SizedBox(height: 24),
                    CustomTextField(
                      controller: _phoneController,
                      prefixIcon: AppIcons.phoneIcon,
                      hintText: "Phone",
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      validator: Validators.phone,
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      text: "Create Account",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<SignupBloc>().add(
                            SignupRequested(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              phone: _phoneController.text.trim(),
                              password: _passwordController.text,
                              rePassword: _confirmPasswordController.text,
                              avatar: _selectedAvatar,
                            ),
                          );
                        }
                      },
                      backgroundColor: AppColors.yellow,
                      textColor: AppColors.black,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Already Have Account ? ",
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: AppColors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.login);
                          },
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(color: AppColors.yellow),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, SignupStates state) {
          if (state is SignupSuccess) {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }
}
