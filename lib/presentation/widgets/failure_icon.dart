import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class FailureIcon extends StatelessWidget {
  const FailureIcon({Key? key}) : super(key: key);

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
