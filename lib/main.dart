import 'package:disconnection_app/presentation/pages/failure_screen.dart';
import 'package:disconnection_app/presentation/pages/progress_screen.dart';
import 'package:disconnection_app/presentation/pages/session_screen.dart';
import 'package:disconnection_app/presentation/pages/success_screen.dart';
import 'package:disconnection_app/presentation/pages/time_selection_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const AppController(),
    );
  }
}

class AppController extends StatefulWidget {
  const AppController({Key? key}) : super(key: key);

  @override
  _AppControllerState createState() => _AppControllerState();
}

enum AppScreen { timeSelection, session, success, failure, progress }

class _AppControllerState extends State<AppController> {
  AppScreen _currentScreen = AppScreen.timeSelection;
  int _sessionMinutes = 0;
  int _completedSessions = 0;

  void _startSession(int minutes) {
    setState(() {
      _sessionMinutes = minutes;
      _currentScreen = AppScreen.session;
    });
  }

  void _sessionCompleted() {
    setState(() {
      _completedSessions++;
      _currentScreen = AppScreen.success;
    });
  }

  void _sessionFailed() {
    setState(() {
      _currentScreen = AppScreen.failure;
    });
  }

  void _viewProgress() {
    setState(() {
      _currentScreen = AppScreen.progress;
    });
  }

  void _reset() {
    setState(() {
      _currentScreen = AppScreen.timeSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentScreen) {
      case AppScreen.timeSelection:
        return TimeSelectionScreen(
          onStartSession: _startSession,
          onViewProgress: _viewProgress,
        );
      case AppScreen.session:
        return SessionScreen(
          totalMinutes: _sessionMinutes,
          onComplete: _sessionCompleted,
          onGiveUp: _sessionFailed,
        );
      case AppScreen.success:
        return SuccessScreen(
          minutes: _sessionMinutes,
          onContinue: _reset,
        );
      case AppScreen.failure:
        return FailureScreen(
          minutes: _sessionMinutes,
          timeSpent: 0, // This would need to be tracked in a real app
          onTryAgain: _reset,
        );
      case AppScreen.progress:
        return ProgressScreen(
          completedSessions: _completedSessions,
          onBack: _reset,
        );
    }
  }
}