
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  final int minutes;
  final int timeSpent;
  final VoidCallback onTryAgain;

  const FailureScreen({
    Key? key,
    required this.minutes,
    required this.timeSpent,
    required this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percentageCompleted = (timeSpent / minutes * 100).round();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.slate.shade900,
              AppColors.slate.shade900,
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
                  const _FailureIcon(),
                  const SizedBox(height: 32),
                  const _FailureMessage(),
                  const SizedBox(height: 32),
                  _StatsCards(
                    percentageCompleted: percentageCompleted,
                    timeSpent: timeSpent,
                  ),
                  const SizedBox(height: 24),
                  const _EncouragementMessage(),
                  const SizedBox(height: 32),
                  _ActionButtons(onTryAgain: onTryAgain),
                  const SizedBox(height: 24),
                  const _MotivationalQuote(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FailureIcon extends StatelessWidget {
  const _FailureIcon({Key? key}) : super(key: key);

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
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          Icon(
            Icons.cancel_outlined,
            color: AppColors.red.shade400,
            size: 80,
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              '🥀',
              style: TextStyle(fontSize: 48),
            ),
          ),
        ],
      ),
    );
  }
}

class _FailureMessage extends StatelessWidget {
  const _FailureMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Don't Give Up!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          "Your tree couldn't grow this time, but you can try again",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.slate.shade300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _StatsCards extends StatelessWidget {
  final int percentageCompleted;
  final int timeSpent;

  const _StatsCards({
    Key? key,
    required this.percentageCompleted,
    required this.timeSpent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.trending_down,
            iconColor: AppColors.red.shade300,
            value: "$percentageCompleted%",
            label: "Completed",
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _StatCard(
            icon: Icons.rotate_left,
            iconColor: AppColors.blue.shade300,
            value: timeSpent.toString(),
            label: "Minutes",
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.05),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 24),
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
              style: TextStyle(color: AppColors.slate.shade300, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class _EncouragementMessage extends StatelessWidget {
  const _EncouragementMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blue.shade500.withOpacity(0.2),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.blue.shade400.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "💡 Tip",
              style: TextStyle(color: Colors.blue.shade200, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Start with shorter sessions and gradually increase the time. Consistency is key!",
              style: TextStyle(color: AppColors.blue.shade100),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback onTryAgain;

  const _ActionButtons({Key? key, required this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: onTryAgain,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.emerald.shade500,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Try Again",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: onTryAgain, // Assuming this goes back to the home/time selection
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: BorderSide(color: Colors.white.withOpacity(0.3)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "Back to Home",
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

class _MotivationalQuote extends StatelessWidget {
  const _MotivationalQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '"Every expert was once a beginner"',
      style: TextStyle(color: AppColors.slate.shade400, fontStyle: FontStyle.italic),
      textAlign: TextAlign.center,
    );
  }
}
