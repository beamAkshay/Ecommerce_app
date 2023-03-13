import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';

import '../../../../../Data/Repositories/login and signup/login_details_repository.dart';
import '../../authentication/authentication_bloc.dart';

part 'login_with_otp_event.dart';
part 'login_with_otp_state.dart';

class LoginWithOtpBloc extends Bloc<LoginWithOtpEvent, LoginWithOtpState> {
      final AddToLocalCartRepository addToLocalCartRepository;

  LoginWithOtpBloc(this.addToLocalCartRepository) : super(LoginWithOtpInitial()) {
     final loginDetailsRepository = LoginDetailsRepository();
    final authenticationBloc = AuthenticationBloc(addToLocalCartRepository);

        on<VerifyOtpEvent>((event, emit) async {
      try {
      //  emit(LoginLoading());

        final loginData = await loginDetailsRepository.getLoginDetailsBasedOnOtp(
            event.phone, event.otp);
    
        if (loginData.status!) {
          authenticationBloc.add(LoggedIn(loginData: loginData));
          emit(LoginWithOtpVerify());
    
        } else {
          emit( LoginWithOtpVerifyFailure(response: loginData));
        }
      } catch (e) {
            

        emit(const LoginWithOtpError(error: "Something went wrong!"));
      }
    });

    on<SendOtpEvent>((event, emit) async {
      try {
        emit(LoginWithOtpLoading());

        final otpData = await loginDetailsRepository.sendOtpRequest(event.mobileNumber);
        
        await Future.delayed(const Duration(seconds: 2));
        if (otpData["status"]) {
          emit(LoginWithOtpSendSuccess(otpData));
    
        } else {
          emit( LoginWithOtpFailure(response: otpData));
        }
      } catch (e) {
        emit(const LoginWithOtpError(error: "Something went wrong!"));
      }
    });
  }
}
