import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';

class TimeOptionList extends StatelessWidget {
  const TimeOptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeOptions = [
      {"minutes": 1, "label": "1 min", "description": "Quick focus"},
      {"minutes": 15, "label": "15 min", "description": "Short break"},
      {"minutes": 30, "label": "30 min", "description": "Deep work"},
      {"minutes": 60, "label": "1 hour", "description": "Study session"},
      {"minutes": 120, "label": "2 hours", "description": "Long focus"},
    ];

    return Column(
      children: timeOptions.map((option) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: _TimeOptionCard(
            minutes: option["minutes"] as int,
            label: option["label"] as String,
            description: option["description"] as String,
            onTap: () => context.read<SessionBloc>().add(StartSession(Duration(minutes: option["minutes"] as int))),
          ),
        );
      }).toList(),
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
