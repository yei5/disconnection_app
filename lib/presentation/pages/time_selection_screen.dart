import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:disconnection_app/presentation/pages/progress_screen.dart';
import 'package:flutter/material.dart';
import 'package:disconnection_app/presentation/widgets/header_widget.dart';
import 'package:disconnection_app/presentation/widgets/time_selection_title.dart';
import 'package:disconnection_app/presentation/widgets/time_option_list.dart';
import 'package:disconnection_app/presentation/widgets/view_progress_button.dart';

class TimeSelectionScreen extends StatelessWidget {
  const TimeSelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.emerald.shade50,
              AppColors.teal.shade50,
            ],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  const HeaderWidget(),
                  const SizedBox(height: 32),

                  // Time Selection Cards
                  const TimeSelectionTitle(),
                  const SizedBox(height: 16),
                  const TimeOptionList(),
                  const SizedBox(height: 24),

                  // View Progress Button
                  ViewProgressButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProgressScreen()));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}