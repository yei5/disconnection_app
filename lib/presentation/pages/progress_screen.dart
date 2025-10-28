import 'package:disconnection_app/presentation/widgets/current_tree_stage_card.dart';
import 'package:disconnection_app/presentation/widgets/stats_grid.dart';
import 'package:disconnection_app/presentation/widgets/stat_card.dart';
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  final int completedSessions;
  final VoidCallback onBack;

  const ProgressScreen({
    Key? key,
    required this.completedSessions,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.green.shade50,
              AppColors.emerald.shade100,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            _buildSliverAppBar(context),
            _buildSliverBody(),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBack,
      ),
      backgroundColor: AppColors.emerald.shade600,
      expandedHeight: 120.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Your Forest",
          style: TextStyle(color: Colors.white),
        ),
        background: Container(
          color: AppColors.emerald.shade600,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildSliverBody() {
    final treeGrowthStages = [
      {"stage": 1, "emoji": "🌱", "name": "Seed", "minSessions": 0},
      {"stage": 2, "emoji": "🌿", "name": "Sprout", "minSessions": 3},
      {"stage": 3, "emoji": "🪴", "name": "Sapling", "minSessions": 7},
      {"stage": 4, "emoji": "🌳", "name": "Young Tree", "minSessions": 15},
      {"stage": 5, "emoji": "🌲", "name": "Mature Tree", "minSessions": 30},
    ];

    final currentStage = treeGrowthStages
        .lastWhere((stage) => completedSessions >= (stage['minSessions'] as int));

    final nextStage = treeGrowthStages.firstWhere(
      (stage) => (stage['minSessions'] as int) > completedSessions,
      orElse: () => treeGrowthStages.last,
    );

    final progressToNext = nextStage['minSessions'] == currentStage['minSessions']
        ? 1.0
        : ((completedSessions - (currentStage['minSessions'] as int)) /
            ((nextStage['minSessions'] as int) - (currentStage['minSessions'] as int)));

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
CurrentTreeStageCard(
              currentStage: currentStage,
              completedSessions: completedSessions,
              nextStage: nextStage,
              progressToNext: progressToNext,
            ),
            const SizedBox(height: 16),
            StatsGrid(completedSessions: completedSessions),
            const SizedBox(height: 16),
            _GrowthTimeline(completedSessions: completedSessions, treeGrowthStages: treeGrowthStages, currentStage: currentStage),
            const SizedBox(height: 16),
            if (completedSessions > 0)
              _ForestDisplay(completedSessions: completedSessions),
          ],
        ),
      ),
    );
  }
}







class _GrowthTimeline extends StatelessWidget {
    final int completedSessions;
    final List<Map<String, Object>> treeGrowthStages;
    final Map<String, Object> currentStage;

  const _GrowthTimeline({Key? key, required this.completedSessions, required this.treeGrowthStages, required this.currentStage}) : super(key: key);

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

class _ForestDisplay extends StatelessWidget {
  final int completedSessions;

  const _ForestDisplay({Key? key, required this.completedSessions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final forest = List.generate(completedSessions.clamp(0, 24), (i) {
      const emojis = ["🌳", "🌲", "🌴", "🎄"];
      return emojis[i % emojis.length];
    });

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Forest',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.emerald.shade900),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: forest.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    forest[index],
                    style: const TextStyle(fontSize: 32),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              '${forest.length} trees planted from your focused sessions!',
              style: TextStyle(color: AppColors.emerald.shade700, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}