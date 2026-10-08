import 'package:flutter/material.dart';
import 'package:movies/core/app_texts.dart';
import '../../../../../core/widgets/app_avatars.dart';

class SignUpAvatars extends StatefulWidget {
  final ValueChanged<String> onAvatarSelected;
  const SignUpAvatars({super.key, required this.onAvatarSelected});

  @override
  State<SignUpAvatars> createState() => _SignUpAvatarsState();
}

class _SignUpAvatarsState extends State<SignUpAvatars> {
  int selectedAvatar = 1;
  late PageController _pageController;

  final List<String> avatars = [
    AppAvatars.pinkHair,
    AppAvatars.beardMan,
    AppAvatars.braidsGirl,
    AppAvatars.blondeMan,
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: selectedAvatar,
      viewportFraction: 0.38,
    );
    widget.onAvatarSelected(avatars[selectedAvatar]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectAvatar(int index) {
    if (selectedAvatar != index) {
      setState(() {
        selectedAvatar = index;
      });
      widget.onAvatarSelected(avatars[index]);
    }
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _pageController,
            itemCount: avatars.length,
            onPageChanged: (index) {
              setState(() {
                selectedAvatar = index;
              });
              widget.onAvatarSelected(avatars[index]);
            },
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double scale = 0.75;
                  if (_pageController.position.haveDimensions &&
                      _pageController.page != null) {
                    final diff = (_pageController.page! - index).abs();
                    scale = (1.0 - (diff * 0.25)).clamp(0.75, 1.0);
                  } else {
                    scale = index == selectedAvatar ? 1.0 : 0.75;
                  }

                  return Center(
                    child: Transform.scale(
                      scale: scale,
                      child: GestureDetector(
                        onTap: () => _selectAvatar(index),
                        child: ClipOval(
                          child: Image.asset(
                            avatars[index],
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(AppTexts.avatar, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
