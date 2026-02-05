import 'package:flutter/material.dart';
import 'package:invtrack/core/widget/bottom_navigation_bar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الإعدادات')),
      body: Center(child: Text('هنا سيتم عرض إعدادات التطبيق')),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
