part of 'login_bloc.dart';

// @immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
} //LoginEvent

final class LoginUsernameChanged extends LoginEvent {
  final String username;

  @override
  List<Object> get props => [username];

  const LoginUsernameChanged(this.username);
} //LoginUsernameChanged

final class LoginPasswordChanged extends LoginEvent {
  final String password;

  @override
  List<Object> get props => [password];

  const LoginPasswordChanged(this.password);
} //LoginPasswordChanged

final class LoginSubmitted extends LoginEvent{
  const LoginSubmitted();
}


