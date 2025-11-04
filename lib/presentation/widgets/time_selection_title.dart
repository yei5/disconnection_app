import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class TimeSelectionTitle extends StatelessWidget {
  const TimeSelectionTitle({Key? key}) : super(key: key);

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
