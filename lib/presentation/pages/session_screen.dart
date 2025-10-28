
import 'dart:async';
import 'package:disconnection_app/presentation/common/app_colors.dart';
import 'package:flutter/material.dart';

class SessionScreen extends StatefulWidget {
  final int totalMinutes;
  final VoidCallback onComplete;
  final VoidCallback onGiveUp;

  const SessionScreen({
    Key? key,
    required this.totalMinutes,
    required this.onComplete,
    required this.onGiveUp,
  }) : super(key: key);

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  late int _remainingSeconds;
  Timer? _timer;
  int _treeStage = 0;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.totalMinutes * 60;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        widget.onComplete();
      } else {
        setState(() {
          _remainingSeconds--;
          _updateTreeStage();
        });
      }
    });
  }

  void _updateTreeStage() {
    final totalSeconds = widget.totalMinutes * 60;
    final progress = (totalSeconds - _remainingSeconds) / totalSeconds;
    if (progress >= 0.75) {
      setState(() => _treeStage = 3);
    } else if (progress >= 0.50) {
      setState(() => _treeStage = 2);
    } else if (progress >= 0.25) {
      setState(() => _treeStage = 1);
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
        return "\uF844"; // Seedling
      case 1:
        return "\uF843"; // Sprout
      case 2:
        return "\uF333"; // Tree
      case 3:
        return "\uF334"; // Evergreen Tree
      default:
        return "\uF845";
    }
  }

  Future<void> _showGiveUpDialog() async {
    final giveUp = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Give up session?"),
        content: const Text(
            "If you leave now, your tree will die and you won't earn any progress. Are you sure you want to give up?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text("Keep going"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text("Give up"),
          ),
        ],
      ),
    );

    if (giveUp == true) {
      widget.onGiveUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalSeconds = widget.totalMinutes * 60;
    final progress = (totalSeconds - _remainingSeconds) / totalSeconds;

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
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _buildTimerAndTree(),
                ),
                _buildProgressBar(progress),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Stay focused...",
          style: TextStyle(color: AppColors.teal.shade200, fontSize: 16),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: _showGiveUpDialog,
        ),
      ],
    );
  }

  Widget _buildTimerAndTree() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _getTreeEmoji(_treeStage),
          style: const TextStyle(fontSize: 100),
        ),
        const SizedBox(height: 32),
        Text(
          _formatTime(_remainingSeconds),
          style: const TextStyle(
            fontSize: 72,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFeatures: [FontFeature.tabularFigures()],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "${(_remainingSeconds / 60).floor()} minutes remaining",
          style: TextStyle(color: AppColors.teal.shade200, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildProgressBar(double progress) {
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
}
