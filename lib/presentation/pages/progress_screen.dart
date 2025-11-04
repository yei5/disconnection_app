import 'package:disconnection_app/presentation/widgets/current_tree_stage_card.dart';
import 'package:disconnection_app/presentation/widgets/stats_grid.dart';
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:disconnection_app/presentation/widgets/growth_timeline.dart';
import 'package:disconnection_app/presentation/widgets/forest_display.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int completedSessions = 0; // This will eventually come from a BLoC

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
            SliverToBoxAdapter(
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
                    GrowthTimeline(completedSessions: completedSessions, treeGrowthStages: treeGrowthStages, currentStage: currentStage),
                    const SizedBox(height: 16),
                    if (completedSessions > 0)
                      ForestDisplay(completedSessions: completedSessions),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
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
}