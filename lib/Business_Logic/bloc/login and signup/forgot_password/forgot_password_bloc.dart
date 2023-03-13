import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Forgot%20Password/forgot_password_response.dart';
import 'package:unicorn_store/Data/Repositories/login%20and%20signup/login_details_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
      final loginDetailsRepository = LoginDetailsRepository();
      
    on<ResetPasswordButtonPressedEvent>((event, emit) async {
      try {
        emit(ForgotPasswordLoading());

        final forgotPasswordData = await loginDetailsRepository.forgotPasswordDetails(event.emailId);
            
        emit(ForgotPasswordResetSuccess(forgotPasswordData));
    
      } catch (e) {
        emit(ForgotPasswordFailure(error: e.toString()));
      }
    });
  }
}
