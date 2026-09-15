import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/text_styles.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/features/onboarding_screen/models/onboarding_model.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingModel data;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingPageItem({
    super.key,
    required this.data,
    required this.isFirst,
    required this.isLast,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(data.image, fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.85),
                Colors.black,
              ],
              stops: const [0.3, 0.6, 1.0],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            decoration: BoxDecoration(
              color: isFirst ? AppColors.transparent : AppColors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: TextStyles.heading2(Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  data.description,
                  textAlign: TextAlign.center,
                  style: isFirst
                      ? TextStyles.title1(Colors.white.withValues(alpha: 0.6))
                      : TextStyles.title1(Colors.white),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: isLast ? 'Finish' : 'Next',
                  backgroundColor: AppColors.yellow,
                  textColor: AppColors.black,
                  onPressed: onNext,
                ),
                if (!isFirst) ...[
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'Back',
                    backgroundColor: Colors.transparent,
                    textColor: const Color(0xFFF6BD00),
                    hasBorder: true,
                    onPressed: onBack,
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
