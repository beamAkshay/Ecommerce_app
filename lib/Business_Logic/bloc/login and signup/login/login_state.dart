part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginData loginData;
  const LoginSuccess(this.loginData);
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class RegistrationSuccess extends LoginState {
  final RegisterResponse registerResponse;

  const RegistrationSuccess(this.registerResponse);
}
