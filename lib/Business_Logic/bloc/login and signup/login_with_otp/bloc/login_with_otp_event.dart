part of 'login_with_otp_bloc.dart';

abstract class LoginWithOtpEvent extends Equatable {
  const LoginWithOtpEvent();

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends LoginWithOtpEvent
{
  
  final String mobileNumber;

  const SendOtpEvent(this.mobileNumber);

  @override
  List<Object> get props => [mobileNumber];

}

class VerifyOtpEvent extends LoginWithOtpEvent
{
  
  final String phone;
  final String otp;

  const VerifyOtpEvent(this.phone,this.otp);

  @override
  List<Object> get props => [phone,otp];

}
