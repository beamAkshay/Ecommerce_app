part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  
  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;

  const ForgotPasswordFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class ForgotPasswordResetSuccess extends ForgotPasswordState
{
  final ForgotPasswordResponse? forgotPasswordResponse;

 const ForgotPasswordResetSuccess(this.forgotPasswordResponse);
}