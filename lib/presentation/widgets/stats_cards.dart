import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:disconnection_app/presentation/widgets/stat_card.dart';

class StatsCards extends StatelessWidget {
  final int minutes;

  const StatsCards({Key? key, required this.minutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatCard(
            icon: Icons.timer,
            color: AppColors.blue,
            value: minutes.toString(),
            label: "Minutes",
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: StatCard(
            icon: Icons.eco,
            color: AppColors.green,
            value: "+1",
            label: "Tree Added",
          ),
        ),
      ],
    );
  }
}
