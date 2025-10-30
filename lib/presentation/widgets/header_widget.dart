import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

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
