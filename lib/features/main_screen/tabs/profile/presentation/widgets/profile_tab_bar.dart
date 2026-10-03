import 'package:flutter/material.dart';

import '../../../../../../core/app_colors.dart';
import '../../../../../../core/text_styles.dart';

class ProfileTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const ProfileTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TabItem(
          icon: Icons.format_list_bulleted_rounded,
          label: 'Watch List',
          isSelected: selectedIndex == 0,
          onTap: () => onTabChanged(0),
        ),
        _TabItem(
          icon: Icons.folder_rounded,
          label: 'History',
          isSelected: selectedIndex == 1,
          onTap: () => onTabChanged(1),
        ),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.yellow : AppColors.white;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: color, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: TextStyles.headingSmall(color),
                  ),
                ],
              ),
            ),
            // Indicator line
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2.5,
              color: isSelected ? AppColors.yellow : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
