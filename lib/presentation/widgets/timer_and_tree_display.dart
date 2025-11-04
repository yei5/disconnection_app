import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';

class TimerAndTreeDisplay extends StatelessWidget {
  const TimerAndTreeDisplay({Key? key}) : super(key: key);

  int _getTreeStage(int totalSeconds, int remainingSeconds) {
    final progress = (totalSeconds - remainingSeconds) / totalSeconds;
    if (progress >= 0.75) {
      return 3;
    } else if (progress >= 0.50) {
      return 2;
    } else if (progress >= 0.25) {
      return 1;
    } else {
      return 0;
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds / 60).floor().toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  String _getTreeEmoji(int stage) {
    switch (stage) {
      case 0:
        return "🌱"; // Seedling
      case 1:
        return "🌿"; // Sprout
      case 2:
        return "🌳"; // Tree
      case 3:
        return "🌲"; // Evergreen Tree
      default:
        return "🌳";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      buildWhen: (previous, current) => current is SessionInProgress,
      builder: (context, state) {
        if (state is SessionInProgress) {
          final totalSeconds = context.read<SessionBloc>().state.duration.inSeconds; // Assuming initial duration is stored in bloc state
          final remainingSeconds = state.duration.inSeconds;
          final treeStage = _getTreeStage(totalSeconds, remainingSeconds);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _getTreeEmoji(treeStage),
                style: const TextStyle(fontSize: 100),
              ),
              const SizedBox(height: 32),
              Text(
                _formatTime(remainingSeconds),
                style: const TextStyle(
                  fontSize: 72,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${(remainingSeconds / 60).floor()} minutes remaining",
                style: TextStyle(color: AppColors.teal.shade200, fontSize: 16),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
