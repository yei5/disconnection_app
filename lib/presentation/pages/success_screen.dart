import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';
import 'package:disconnection_app/presentation/widgets/success_icon.dart';
import 'package:disconnection_app/presentation/widgets/success_message.dart';
import 'package:disconnection_app/presentation/widgets/stats_cards.dart';
import 'package:disconnection_app/presentation/widgets/achievement_badge.dart';
import 'package:disconnection_app/presentation/widgets/action_buttons.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          final minutes = (state is SessionSuccess) ? state.duration.inMinutes : 0;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.emerald.shade500,
                  AppColors.teal.shade600,
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
                      const SuccessIcon(),
                      const SizedBox(height: 32),
                      const SuccessMessage(),
                      const SizedBox(height: 32),
                      StatsCards(minutes: minutes),
                      const SizedBox(height: 24),
                      AchievementBadge(minutes: minutes),
                      const SizedBox(height: 32),
                      ActionButtons(onContinue: () {
                        Navigator.of(context).pop(); // Pop SuccessScreen
                      }),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
