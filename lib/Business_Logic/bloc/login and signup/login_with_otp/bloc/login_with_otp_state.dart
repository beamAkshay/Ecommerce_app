part of 'login_with_otp_bloc.dart';

abstract class LoginWithOtpState extends Equatable {
  const LoginWithOtpState();

  @override
  List<Object> get props => [];
}

class LoginWithOtpInitial extends LoginWithOtpState {}

class LoginWithOtpLoading extends LoginWithOtpState {}

class LoginWithOtpSendSuccess extends LoginWithOtpState {
  final Map<String, dynamic> response;

  const LoginWithOtpSendSuccess(this.response);
}

class LoginWithOtpFailure extends LoginWithOtpState {
  final Map<String, dynamic> response;

  const LoginWithOtpFailure({required this.response});

  @override
  List<Object> get props => [response];
}

class LoginWithOtpVerify extends LoginWithOtpState {}

class LoginWithOtpVerifyFailure extends LoginWithOtpState {
  final LoginData response;

  const LoginWithOtpVerifyFailure({required this.response});

  @override
  List<Object> get props => [response];
}

class LoginWithOtpError extends LoginWithOtpState {
  final String error;

  const LoginWithOtpError({required this.error});

  @override
  List<Object> get props => [error];
}
