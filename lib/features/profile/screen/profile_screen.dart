import 'package:flutter/material.dart';
import 'package:invtrack/core/widget/bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الملف الشخصي'),
      ),
      body: Center(
        child: Text('هنا سيتم عرض معلومات الملف الشخصي'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}