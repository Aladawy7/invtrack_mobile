import 'package:flutter/material.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الشاشة الخاصة بالمكان'),
      ),
      body: Center(
        child: Text('هنا سيتم عرض معلومات المكان'),
      ),
    );
  }
}