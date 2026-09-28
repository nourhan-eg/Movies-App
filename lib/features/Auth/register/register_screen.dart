import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/features/Auth/register/widgets/sign_up_avatars.dart';

import '../../../core/app_icons.dart';
import '../../../core/app_routes.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "register route";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
        title: Text("Register" , style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.yellow),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SignUpAvatars(),
            SizedBox(height: 24),
            CustomTextField(
              controller: _nameController,
              prefixIcon: AppIcons.nameIcon,
              hintText: "Name",
              obscureText: false,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 24),
            CustomTextField(
              controller: _emailController,
              prefixIcon: AppIcons.emailIcon,
              hintText: "Email",
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),
            CustomTextField(
              controller: _passwordController,
              prefixIcon: AppIcons.passwordIcon,
              hintText: "password",
              obscureText: true,
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 24),
            CustomTextField(
              controller: _confirmPasswordController,
              prefixIcon: AppIcons.passwordIcon,
              hintText: "Confirm Password",
              isPassword: true,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 24),
            CustomTextField(
              controller: _phoneController,
              prefixIcon: AppIcons.phoneIcon,
              hintText: "Phone",
              obscureText: false,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 24),
            CustomButton(
              text: "Create Account",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
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
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text(
                    "Login",
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color: AppColors.yellow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
