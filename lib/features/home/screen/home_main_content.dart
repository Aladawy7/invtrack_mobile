import 'package:flutter/material.dart';
import 'package:invtrack/features/home/widget/header.dart';
import 'package:invtrack/features/home/widget/last_activities.dart';
import 'package:invtrack/features/home/widget/progress.dart';
import 'package:invtrack/features/home/widget/session-card.dart';
import 'package:invtrack/features/home/widget/state_card.dart';

class HomeMainContent extends StatelessWidget {
  const HomeMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(),
          const SizedBox(height: 20),
          // Start Session Card
          Sessioncard(),
          const SizedBox(height: 20),
          // Stats Row
          Row(
            children: [
              StatCard(
                label: 'حالة جديدة',
                value: '8',
                color: Colors.green,
                icon: Icons.check_circle,
              ),
              const SizedBox(width: 12),
              StatCard(
                label: 'إجمالي العهد',
                value: '1',
                color: Colors.blue,
                icon: Icons.inventory_2,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              StatCard(
                label: 'حالة مفقودة',
                value: '1',
                color: Colors.red,
                icon: Icons.cancel,
              ),
              const SizedBox(width: 12),
              StatCard(
                label: 'حالة تالفة',
                value: '1',
                color: Colors.orange,
                icon: Icons.warning,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Progress
          Progress(),
          const SizedBox(height: 20),
          // Last Activities
          LastActivities(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
