part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ResetPasswordButtonPressedEvent extends ForgotPasswordEvent
{
  final String emailId;

 const ResetPasswordButtonPressedEvent({required this.emailId});

@override
  List<Object> get props => [emailId];

}