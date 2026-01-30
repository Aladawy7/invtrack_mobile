import 'package:flutter/material.dart';
import 'package:glaze_nav_bar/glaze_nav_bar.dart';
import 'package:invtrack/core/utils/colors.dart';

class DemoPage {
  final String title;
  final IconData icon;
  final String description;
  final Color color;

  DemoPage({
    required this.title,
    required this.icon,
    required this.description,
    required this.color,
  });
}

class MyBottomNavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  const MyBottomNavigationBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlazeNavBar(
      index: index,
      backgroundColor: Colors.transparent,
      items: const [
        GlazeNavBarItem(
          child: Icon(Icons.home, color: AppColors.primary),
          label: ' الرئيسية',
        ),
        GlazeNavBarItem(
          child: Icon(Icons.gradient, color: AppColors.primary),
          label: 'السجل',
          badgeCount: 3,
          badgeColor: Colors.red,
          activeBadgeColor: Colors.orange,
        ),
        GlazeNavBarItem(
          child: Icon(Icons.notifications, color: AppColors.primary),
          label: 'الملف الشخصي',
          showBadge: true,
          badgeColor: Colors.red,
        ),
        GlazeNavBarItem(
          child: Icon(Icons.settings, color: AppColors.primary),
          label: 'الإعدادات',
        ),
      ],
      onTap: onTap,
    );
  }
}
