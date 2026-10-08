import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';
import 'package:movies/core/app_texts.dart';
import 'package:movies/core/text_styles.dart';
import 'package:movies/core/widgets/app_avatars.dart';

class AvatarPickerSheet extends StatefulWidget {
  final String selectedAvatar;

  const AvatarPickerSheet({super.key, required this.selectedAvatar});

  static Future<String?> show(BuildContext context, String current) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.darkGrey,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => AvatarPickerSheet(selectedAvatar: current),
    );
  }

  @override
  State<AvatarPickerSheet> createState() => _AvatarPickerSheetState();
}

class _AvatarPickerSheetState extends State<AvatarPickerSheet> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedAvatar;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppTexts.chooseAvatar,
            style: TextStyles.headingSmall(AppColors.white),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppAvatars.all.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (_, index) {
              final path = AppAvatars.all[index];
              final isSelected = path == _selected;
              return GestureDetector(
                onTap: () {
                  setState(() => _selected = path);
                  Navigator.of(context).pop(path);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppColors.yellow : AppColors.darkGrey2,
                      width: isSelected ? 3 : 1,
                    ),
                    color: isSelected
                        ? AppColors.yellow.withAlpha(40)
                        : AppColors.darkGrey2,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(path, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
