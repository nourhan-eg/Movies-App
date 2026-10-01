import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_avatars.dart';

class SignUpAvatars extends StatefulWidget {
  final ValueChanged<String> onAvatarSelected;
  const SignUpAvatars({super.key, required this.onAvatarSelected});

  @override
  State<SignUpAvatars> createState() => _SignUpAvatarsState();
}

class _SignUpAvatarsState extends State<SignUpAvatars> {
  int selectedAvatar = 1;

  final List<String> avatars = [
    AppAvatars.pinkHair,
    AppAvatars.beardMan,
    AppAvatars.braidsGirl,
    AppAvatars.blondeMan,
  ];

  @override
  void initState() {
    super.initState();
    widget.onAvatarSelected(avatars[selectedAvatar]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: avatars.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedAvatar == index;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAvatar = index;
                    });
                    widget.onAvatarSelected(avatars[index]);
                  },
                  child: CircleAvatar(
                    radius: isSelected ? 55 : 35,
                    backgroundImage: AssetImage(avatars[index]),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Text('Avatar', style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
