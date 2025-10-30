import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class GrowthTimeline extends StatelessWidget {
  final int completedSessions;
  final List<Map<String, Object>> treeGrowthStages;
  final Map<String, Object> currentStage;

  const GrowthTimeline({
    Key? key,
    required this.completedSessions,
    required this.treeGrowthStages,
    required this.currentStage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Growth Stages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.emerald.shade900),
            ),
            const SizedBox(height: 16),
            ...treeGrowthStages.map((stage) {
              final isCompleted = completedSessions >= (stage['minSessions'] as int);
              final isCurrent = stage['stage'] == currentStage['stage'];
              return _GrowthStageTile(stage: stage, isCompleted: isCompleted, isCurrent: isCurrent);
            }),
          ],
        ),
      ),
    );
  }
}

class _GrowthStageTile extends StatelessWidget {
  final Map<String, Object> stage;
  final bool isCompleted;
  final bool isCurrent;

  const _GrowthStageTile({
    Key? key,
    required this.stage,
    required this.isCompleted,
    required this.isCurrent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCurrent ? AppColors.emerald.shade100 : (isCompleted ? AppColors.emerald.shade50 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        border: isCurrent ? Border.all(color: AppColors.emerald.shade400, width: 2) : null,
      ),
      child: Row(
        children: [
          Text(stage['emoji'] as String, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stage['name'] as String,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.emerald.shade900),
                ),
                Text(
                  '${stage['minSessions']} sessions required',
                  style: TextStyle(color: AppColors.emerald.shade600),
                ),
              ],
            ),
          ),
          if (isCurrent)
            const Chip(
              label: Text('Current'),
              backgroundColor: AppColors.emerald,
              labelStyle: TextStyle(color: Colors.white),
            )
          else if (isCompleted)
            const Icon(Icons.check_circle, color: AppColors.emerald),
        ],
      ),
    );
  }
}
