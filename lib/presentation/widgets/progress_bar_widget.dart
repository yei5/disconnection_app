import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      buildWhen: (previous, current) => current is SessionInProgress,
      builder: (context, state) {
        if (state is SessionInProgress) {
          final totalSeconds = context.read<SessionBloc>().state.duration.inSeconds; // Assuming initial duration is stored in bloc state
          final remainingSeconds = state.duration.inSeconds;
          final progress = (totalSeconds - remainingSeconds) / totalSeconds;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.teal.shade800,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                "Your tree is growing...",
                style: TextStyle(color: AppColors.teal.shade200, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
