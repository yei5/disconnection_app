import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class ViewProgressButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewProgressButton({Key? key, required this.onPressed}) : super(key: key);

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
