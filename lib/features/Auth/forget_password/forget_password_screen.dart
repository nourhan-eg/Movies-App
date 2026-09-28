import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_icons.dart';
import 'package:movies/core/app_images.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/core/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "forget password route";
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
        title: Text(
          "Forget Password",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 24),
            Image.asset(
              AppImages.forgetPassword,
              height: 220,
            ),
            SizedBox(height: 32),
            CustomTextField(
              controller: _emailController,
              prefixIcon: AppIcons.emailIcon,
              hintText: "Email",
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),
            CustomButton(
              text: "Verify Email",
              onPressed: () {
                // TODO: send verification email
              },
              backgroundColor: AppColors.yellow,
              textColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}