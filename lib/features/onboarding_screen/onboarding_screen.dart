import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_routes.dart';
import 'package:movies/core/app_texts.dart';
import 'package:movies/core/text_styles.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/features/onboarding_screen/models/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const routeName = "onboarding route";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final item in onboardingData) {
      precacheImage(AssetImage(item.image), context);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  void _next() {
    final page = _currentPageNotifier.value;
    if (page == onboardingData.length - 1) {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _back() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. PageView: only swipes background images and gradient overlay
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) => _currentPageNotifier.value = index,
            itemBuilder: (context, index) {
              final data = onboardingData[index];
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
                          Colors.black.withValues(alpha: 0.85),
                          Colors.black,
                        ],
                        stops: const [0.3, 0.6, 1.0],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // 2. Fixed bottom card: exact same UI, only this subtree updates
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder<int>(
              valueListenable: _currentPageNotifier,
              builder: (context, page, _) {
                final data = onboardingData[page];
                final isFirst = page == 0;
                final isLast = page == onboardingData.length - 1;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  decoration: BoxDecoration(
                    color: isFirst ? AppColors.transparent : AppColors.black,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            data.title,
                            key: ValueKey('title_$page'),
                            textAlign: TextAlign.center,
                            style: TextStyles.heading2(Colors.white),
                          ),
                        ),
                        if (data.description.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Text(
                              data.description,
                              key: ValueKey('desc_$page'),
                              textAlign: TextAlign.center,
                              style: isFirst
                                  ? TextStyles.title1(Colors.white.withValues(alpha: 0.6))
                                  : TextStyles.title1(Colors.white),
                            ),
                          ),
                        ],
                        const SizedBox(height: 20),
                        CustomButton(
                          text: isLast ? AppTexts.finish : AppTexts.next,
                          backgroundColor: AppColors.yellow,
                          textColor: AppColors.black,
                          onPressed: _next,
                        ),
                        if (!isFirst) ...[
                          const SizedBox(height: 12),
                          CustomButton(
                            text: AppTexts.back,
                            backgroundColor: Colors.transparent,
                            textColor: const Color(0xFFF6BD00),
                            hasBorder: true,
                            onPressed: _back,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
