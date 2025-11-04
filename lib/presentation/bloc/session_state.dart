part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  final Duration duration;
  const SessionState(this.duration);

  @override
  List<Object> get props => [duration];
}

class SessionInitial extends SessionState {
  const SessionInitial(Duration duration) : super(duration);
}

class SessionInProgress extends SessionState {
  const SessionInProgress(Duration duration) : super(duration);
}

class SessionSuccess extends SessionState {
  const SessionSuccess() : super(Duration.zero);
}

class SessionFailure extends SessionState {
  const SessionFailure() : super(Duration.zero);
}
