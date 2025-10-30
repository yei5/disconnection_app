import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class FailureMessage extends StatelessWidget {
  const FailureMessage({Key? key}) : super(key: key);

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
