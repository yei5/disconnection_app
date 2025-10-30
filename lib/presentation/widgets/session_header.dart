import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';

class SessionHeader extends StatelessWidget {
  const SessionHeader({Key? key}) : super(key: key);

  Future<void> _showGiveUpDialog(BuildContext context) async {
    final giveUp = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Give up session?"),
        content: const Text(
            "If you leave now, your tree will die and you won't earn any progress. Are you sure you want to give up?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text("Keep going"),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text("Give up"),
          ),
        ],
      ),
    );

    if (giveUp == true) {
      context.read<SessionBloc>().add(EndSession()); // Dispatch EndSession event
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Stay focused...",
          style: TextStyle(color: AppColors.teal.shade200, fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => _showGiveUpDialog(context),
        ),
      ],
    );
  }
}
