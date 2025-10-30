import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';
import 'package:disconnection_app/presentation/widgets/session_header.dart';
import 'package:disconnection_app/presentation/widgets/timer_and_tree_display.dart';
import 'package:disconnection_app/presentation/widgets/progress_bar_widget.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // App is going to the background, end the session as a failure
      context.read<SessionBloc>().add(EndSession());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.teal.shade900,
              AppColors.emerald.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocListener<SessionBloc, SessionState>(
              listener: (context, state) {
                if (state is SessionSuccess) {
                  Navigator.of(context).pop(); // Pop SessionScreen
                } else if (state is SessionFailure) {
                  Navigator.of(context).pop(); // Pop SessionScreen
                }
              },
              child: const Column(
                children: [
                  SessionHeader(),
                  Expanded(
                    child: TimerAndTreeDisplay(),
                  ),
                  ProgressBarWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}