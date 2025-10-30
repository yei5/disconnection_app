import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';
import 'package:disconnection_app/presentation/widgets/failure_icon.dart';
import 'package:disconnection_app/presentation/widgets/failure_message.dart';
import 'package:disconnection_app/presentation/widgets/failure_stats_cards.dart';
import 'package:disconnection_app/presentation/widgets/encouragement_message.dart';
import 'package:disconnection_app/presentation/widgets/failure_action_buttons.dart';
import 'package:disconnection_app/presentation/widgets/motivational_quote.dart';

class FailureScreen extends StatelessWidget {
  const FailureScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          final minutes = (state is SessionFailure) ? state.duration.inMinutes : 0;
          final timeSpent = (state is SessionFailure) ? (context.read<SessionBloc>().state as SessionInProgress).duration.inMinutes - state.duration.inMinutes : 0; // This needs to be properly calculated from the bloc
          final percentageCompleted = (timeSpent / minutes * 100).round();

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.slate.shade900,
                  AppColors.slate.shade900,
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
                      const FailureIcon(),
                      const SizedBox(height: 32),
                      const FailureMessage(),
                      const SizedBox(height: 32),
                      FailureStatsCards(
                        percentageCompleted: percentageCompleted,
                        timeSpent: timeSpent,
                      ),
                      const SizedBox(height: 24),
                      const EncouragementMessage(),
                      const SizedBox(height: 32),
                      FailureActionButtons(onTryAgain: () {
                        Navigator.of(context).pop(); // Pop FailureScreen
                      }),
                      const SizedBox(height: 24),
                      const MotivationalQuote(),
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
