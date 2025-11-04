import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
  const SuccessMessage({Key? key}) : super(key: key);

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
