import 'package:flutter/material.dart';
import 'package:invtrack/core/utils/colors.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'نسبة الإنجاز',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: 1.0,
            backgroundColor: Colors.grey[300],
            color: AppColors.primary,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          const SizedBox(height: 8),
          const Text(
            'تم جرد 10 من أصل 10 عهدة',
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
