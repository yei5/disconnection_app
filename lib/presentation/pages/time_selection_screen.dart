import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class TimeSelectionScreen extends StatelessWidget {
  final void Function(int) onStartSession;
  final VoidCallback onViewProgress;

  const TimeSelectionScreen({
    Key? key,
    required this.onStartSession,
    required this.onViewProgress,
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
              AppColors.emerald.shade50,
              AppColors.teal.shade50,
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
                  // Header
                  const _Header(),
                  const SizedBox(height: 32),

                  // Time Selection Cards
                  const _TimeSelectionTitle(),
                  const SizedBox(height: 16),
                  ..._buildTimeOptions(),
                  const SizedBox(height: 24),

                  // View Progress Button
                  _ViewProgressButton(onPressed: onViewProgress),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTimeOptions() {
    final timeOptions = [
      {"minutes": 10, "label": "10 min", "description": "Quick focus"},
      {"minutes": 15, "label": "15 min", "description": "Short break"},
      {"minutes": 30, "label": "30 min", "description": "Deep work"},
      {"minutes": 60, "label": "1 hour", "description": "Study session"},
      {"minutes": 120, "label": "2 hours", "description": "Long focus"},
    ];

    return timeOptions.map((option) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: _TimeOptionCard(
          minutes: option["minutes"] as int,
          label: option["label"] as String,
          description: option["description"] as String,
          onTap: () => onStartSession(option["minutes"] as int),
        ),
      );
    }).toList();
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.emerald.shade500,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.eco,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Focus & Grow",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.emerald.shade900,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Stay focused and watch your tree grow",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.emerald.shade700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _TimeSelectionTitle extends StatelessWidget {
  const _TimeSelectionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Select a focus session",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.emerald.shade800,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _TimeOptionCard extends StatelessWidget {
  final int minutes;
  final String label;
  final String description;
  final VoidCallback onTap;

  const _TimeOptionCard({
    Key? key,
    required this.minutes,
    required this.label,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.emerald.shade100, width: 2),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.emerald.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.timer_outlined,
                  color: AppColors.emerald.shade600,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.emerald.shade900,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.emerald.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.emerald.shade500,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewProgressButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ViewProgressButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: AppColors.emerald.shade300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        "View Your Forest",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.emerald.shade700,
        ),
      ),
    );
  }
}
