import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({Key? key}) : super(key: key);

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
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 80,
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: Text(
              '🌳',
              style: TextStyle(fontSize: 48),
            ),
          ),
        ],
      ),
    );
  }
}
