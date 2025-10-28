
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class CurrentTreeStageCard extends StatelessWidget {
  final Map<String, Object> currentStage;
  final int completedSessions;
  final Map<String, Object> nextStage;
  final double progressToNext;

  const CurrentTreeStageCard({
    Key? key,
    required this.currentStage,
    required this.completedSessions,
    required this.nextStage,
    required this.progressToNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(currentStage['emoji'] as String, style: const TextStyle(fontSize: 80)),
            const SizedBox(height: 16),
            Chip(
              label: const Text('Current Stage'),
              backgroundColor: AppColors.emerald.shade600,
              labelStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              currentStage['name'] as String,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.emerald.shade900),
            ),
            const SizedBox(height: 4),
            Text(
              '$completedSessions sessions completed',
              style: TextStyle(fontSize: 16, color: AppColors.emerald.shade700),
            ),
            if (nextStage['minSessions'] != currentStage['minSessions'])
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Progress to ${nextStage['name']}'),
                        Text('$completedSessions / ${nextStage['minSessions']}'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progressToNext,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(5),
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
