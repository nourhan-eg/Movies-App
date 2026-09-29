import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool hasBorder;
  final bool isLoading;
  final String? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.hasBorder = false,
    this.isLoading = false,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          elevation: 0,
          side: hasBorder
              ? BorderSide(color: textColor, width: 2)
              : BorderSide.none,
        ),
        child: isLoading
            ? CircularProgressIndicator(color: textColor)
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              SvgPicture.asset(
                icon!,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyles.title2(textColor),
            ),
          ],
        ),
      ),
    );
  }
}
