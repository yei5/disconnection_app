part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class StartSession extends SessionEvent {
  final Duration duration;

  const StartSession(this.duration);

  @override
  List<Object> get props => [duration];
}

class EndSession extends SessionEvent {}

class Tick extends SessionEvent {
  final Duration duration;

  const Tick(this.duration);

  @override
  List<Object> get props => [duration];
}
