import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:disconnection_app/presentation/widgets/stat_card.dart';

class FailureStatsCards extends StatelessWidget {
  final int percentageCompleted;
  final int timeSpent;

  const FailureStatsCards({
    Key? key,
    required this.percentageCompleted,
    required this.timeSpent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.trending_down,
            color: AppColors.red,
            value: "$percentageCompleted%",
            label: "Completed",
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: StatCard(
            icon: Icons.rotate_left,
            color: AppColors.blue,
            value: timeSpent.toString(),
            label: "Minutes",
          ),
        ),
      ],
    );
  }
}
