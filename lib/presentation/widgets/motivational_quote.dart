import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class MotivationalQuote extends StatelessWidget {
  const MotivationalQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '"Every expert was once a beginner"',
      style: TextStyle(color: AppColors.slate.shade400, fontStyle: FontStyle.italic),
      textAlign: TextAlign.center,
    );
  }
}
