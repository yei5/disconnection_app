
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final int minutes;
  final VoidCallback onContinue;

  const SuccessScreen({
    Key? key,
    required this.minutes,
    required this.onContinue,
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
              AppColors.emerald.shade500,
              AppColors.teal.shade600,
            ],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _SuccessIcon(),
                  const SizedBox(height: 32),
                  const _SuccessMessage(),
                  const SizedBox(height: 32),
                  _StatsCards(minutes: minutes),
                  const SizedBox(height: 24),
                  _AchievementBadge(minutes: minutes),
                  const SizedBox(height: 32),
                  _ActionButtons(onContinue: onContinue),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SuccessIcon extends StatelessWidget {
  const _SuccessIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 80,
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: Text(
              '🌳',
              style: TextStyle(fontSize: 48),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuccessMessage extends StatelessWidget {
  const _SuccessMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Great Job!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "You stayed focused and grew a beautiful tree",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.emerald.shade50,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _StatsCards extends StatelessWidget {
  final int minutes;

  const _StatsCards({Key? key, required this.minutes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.timer,
            value: minutes.toString(),
            label: "Minutes",
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: _StatCard(
            icon: Icons.eco,
            value: "+1",
            label: "Tree Added",
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: AppColors.emerald.shade200, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(color: AppColors.emerald.shade100, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  final int minutes;

  const _AchievementBadge({Key? key, required this.minutes}) : super(key: key);

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

class _ActionButtons extends StatelessWidget {
  final VoidCallback onContinue;

  const _ActionButtons({Key? key, required this.onContinue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onContinue,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            overlayColor: AppColors.emerald.shade600,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Start Another Session",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: onContinue, // Assuming this leads to the forest screen
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "View Your Forest",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
