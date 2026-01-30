import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        // Logo
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: const Color(0xFF0F4C81),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.apartment,
            color: Colors.white,
            size: 50,
          ),
        ),
        const SizedBox(height: 24),
        // App Title
        const Text(
          'نظام الجرد الحكومي',
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Subtitle
        const Text(
          'تتبع الأصول والمعدات',
          style: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
