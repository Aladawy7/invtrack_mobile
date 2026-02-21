import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invtrack/core/routes/routes.dart';
import 'package:invtrack/core/utils/colors.dart';

class AssetsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  

  const AssetsAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      actions: [
        IconButton(
          onPressed: () => context.go(Routes.locationscreen),
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
            const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
