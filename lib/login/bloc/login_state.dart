part of 'login_bloc.dart';

// @immutable
// sealed
class LoginState extends Equatable {
  final bool isValid;
  final Username username;
  final Password password;
  final FormzSubmissionStatus status;


  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
  });

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Password? password,
    bool? isValid,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
    );
  } //copyWith

  @override
  List<Object> get props =>  [status, username, password ];



} //LoginState

// final class LoginInitial extends LoginState {}
