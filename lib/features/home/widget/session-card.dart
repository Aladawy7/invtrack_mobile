import 'package:flutter/material.dart';
import 'package:invtrack/core/utils/colors.dart';

class Sessioncard extends StatelessWidget {
  const Sessioncard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          Icon(Icons.qr_code, color: Colors.white, size: 40),
          SizedBox(height: 12),
          Text(
            'بدء جلسة جرد',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'ابدأ بمسح الوصول في الموقع المحدد',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
