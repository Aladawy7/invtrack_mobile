import 'package:flutter/material.dart';
import 'package:invtrack/core/widget/bottom_navigation_bar.dart';
import 'package:invtrack/features/home/screen/home_main_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeMainContent(),
    Center(child: Text('Gradients')),
    Center(child: Text('Badges')),
    Center(child: Text('Custom')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      extendBody: true,
      bottomNavigationBar: MyBottomNavigationBar(
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
