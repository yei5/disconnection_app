import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class EncouragementMessage extends StatelessWidget {
  const EncouragementMessage({Key? key}) : super(key: key);

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
