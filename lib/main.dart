import 'package:disconnection_app/presentation/pages/failure_screen.dart';
import 'package:disconnection_app/presentation/pages/progress_screen.dart';
import 'package:disconnection_app/presentation/pages/session_screen.dart';
import 'package:disconnection_app/presentation/pages/success_screen.dart';
import 'package:disconnection_app/presentation/pages/time_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disconnection_app/presentation/bloc/session_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context) => SessionBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus & Grow',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocConsumer<SessionBloc, SessionState>(
        listener: (context, state) {
          if (state is SessionInProgress) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SessionScreen()),
            );
          } else if (state is SessionSuccess) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const SuccessScreen()),
            );
          } else if (state is SessionFailure) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const FailureScreen()),
            );
          }
        },
        builder: (context, state) {
          return const TimeSelectionScreen();
        },
      ),
    );
  }
}