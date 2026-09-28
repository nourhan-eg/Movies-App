import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_icons.dart';
import 'package:movies/core/app_images.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/core/widgets/custom_text_field.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(AppImages.moviesLogo),
            CustomTextField(
              controller: _emailController,
              prefixIcon: AppIcons.emailIcon,
              hintText: "Email",
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 22),
            CustomTextField(
              controller: _passwordController,
              prefixIcon: AppIcons.passwordIcon,
              hintText: "Password",
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
                    Navigator.pushNamed(context, AppRoutes.forgetPassword);
                  },
                  child: Text(
                    "Forget Your Password ?",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: AppColors.yellow),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            CustomButton(
              text: "Login",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.main);
              },
              backgroundColor: AppColors.yellow,
              textColor: AppColors.black,
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  "Don’t Have Account ? ",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.register);
                  },
                  child: Text(
                    "Create One",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: AppColors.yellow),
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment:  .center,
              children: [
                SizedBox(
                  width: 92,
                  child: Divider(
                    color: AppColors.yellow,
                    thickness: 1,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "OR",
                    style:Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: AppColors.yellow),
                  ),
                ),

                SizedBox(
                  width: 92,
                  child: Divider(
                    color: AppColors.yellow,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28),
            CustomButton(
              text: "Login With Google",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.main);
              },
              backgroundColor: AppColors.yellow,
              textColor: AppColors.black,
              icon: AppIcons.googleIcon,
            ),
          ],
        ),
      ),
    );
  }
}
