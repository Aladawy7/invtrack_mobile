import 'package:flutter/material.dart';
import 'package:invtrack/core/widget/bottom_navigation_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تاريخ العمليات'),
      ),
      body: Center(
        child: Text('هنا سيتم عرض تاريخ العمليات'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}