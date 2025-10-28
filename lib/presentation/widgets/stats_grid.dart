
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:disconnection_app/presentation/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  final int completedSessions;

  const StatsGrid({Key? key, required this.completedSessions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        StatCard(
          icon: Icons.emoji_events,
          color: AppColors.emerald,
          value: completedSessions.toString(),
          label: 'Total Sessions',
        ),
        StatCard(
          icon: Icons.local_fire_department,
          color: AppColors.orange,
          value: '${(completedSessions).clamp(0, 7)}', // Mocked
          label: 'Day Streak',
        ),
        StatCard(
          icon: Icons.flag,
          color: AppColors.blue,
          value: '${completedSessions * 30}', // Mocked
          label: 'Total Minutes',
        ),
        StatCard(
          icon: Icons.calendar_today,
          color: AppColors.purple,
          value: '${(completedSessions / 7).ceil()}', // Mocked
          label: 'Weeks Active',
        ),
      ],
    );
  }
}
