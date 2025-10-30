import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  StreamSubscription<Duration>? _tickerSubscription;

  SessionBloc() : super(const SessionInitial(Duration.zero)) {
    on<StartSession>(_onStartSession);
    on<EndSession>(_onEndSession);
    on<Tick>(_onTick);
  }

  void _onStartSession(StartSession event, Emitter<SessionState> emit) {
    _tickerSubscription?.cancel();
    emit(SessionInProgress(event.duration));
    _tickerSubscription = Stream.periodic(const Duration(seconds: 1), (x) => event.duration - Duration(seconds: x + 1))
        .take(event.duration.inSeconds)
        .listen((duration) => add(Tick(duration)));
    // Removed onDone here, will handle in _onTick
  }

  void _onEndSession(EndSession event, Emitter<SessionState> emit) {
    _tickerSubscription?.cancel();
    emit(const SessionSuccess());
  }

  void _onTick(Tick event, Emitter<SessionState> emit) {
    if (event.duration > Duration.zero) {
      emit(SessionInProgress(event.duration));
    } else {
      add(EndSession()); // When duration reaches 0, end the session
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}