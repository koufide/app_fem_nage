part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
} //TimerState

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() {
    return '==> timer_state =>> TimerInitial.toString =>>> TimerInitial { duration: $duration } ';
  } //toString
} //TimerInitial

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() =>
      '==> timer_state =>> TimerRunPause.toString =>>> TimerRunPause { duration: $duration }';
} //TimerRunPause

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => '==> timer_state =>> TimerRunInProgress.toString =>>>  TimerRunInProgress { duration: $duration }';
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
