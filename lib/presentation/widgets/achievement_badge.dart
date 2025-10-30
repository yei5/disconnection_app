import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class AchievementBadge extends StatelessWidget {
  final int minutes;

  const AchievementBadge({Key? key, required this.minutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              AppColors.amber.shade400,
              AppColors.yellow.shade400,
            ],
          ),
          border: Border.all(color: AppColors.amber.shade300),
        ),
        child: Row(
          children: [
            Icon(Icons.emoji_events, color: AppColors.amber.shade900, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Achievement Unlocked!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.amber.shade900,
                    ),
                  ),
                  Text(
                    minutes >= 60 ? "Deep Focus Master" : "Focused Mind",
                    style: TextStyle(color: AppColors.amber.shade800),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
