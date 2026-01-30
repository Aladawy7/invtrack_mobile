import 'package:flutter/material.dart';

class LastActivities extends StatelessWidget {
  const LastActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: const [
          Icon(Icons.qr_code, color: Colors.grey, size: 40),
          SizedBox(height: 8),
          Text(
            'لا توجد نشاطات سابقة',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'ابدأ أول جلسة جرد لعرض النشاطات',
            style: TextStyle(color: Colors.black38, fontSize: 13),
          ),
          SizedBox(height: 400),
        ],
      ),
    );
  }
}
