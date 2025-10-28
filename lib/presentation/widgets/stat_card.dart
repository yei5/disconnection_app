
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final MaterialColor color;
  final String value;
  final String label;

  const StatCard({
    Key? key,
    required this.icon,
    required this.color,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.shade100,
            child: Icon(icon, color: color.shade600, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.emerald.shade900),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: AppColors.emerald.shade600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
