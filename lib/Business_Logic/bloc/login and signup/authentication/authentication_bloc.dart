import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Logout/logout_details.dart';
import 'package:unicorn_store/Data/Repositories/login%20and%20signup/login_details_repository.dart';

import '../../../../Data/Repositories/cart/add_to_local_cart_repository.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AddToLocalCartRepository addToLocalCartRepository;

  AuthenticationBloc(this.addToLocalCartRepository)
      : super(AuthenticationUninitialized()) {
    final LoginDetailsRepository loginDetailsRepository =
        LoginDetailsRepository();

    on<AppStarted>((event, emit) async {
      await addToLocalCartRepository.init();
      final bool hasToken = await loginDetailsRepository.hasToken();
      final bool hasOnBoarding =
          await loginDetailsRepository.hasOnBoardingScreenData();

      if (hasOnBoarding) {
        if (hasToken) {
          final loginData = await loginDetailsRepository.getTokenData();

          emit(AuthenticationAuthenticated(
              loginData: LoginData.fromJson(jsonDecode(loginData!))));
        } else {
          emit(AuthenticationUnauthenticated());
        }
      } else {
        emit(AuthenticatedOnboardingIncomplete());
      }
    });

    on<SaveOnBoardingScreenData>((event, emit) async {
      emit(AuthenticationLoading());

      await loginDetailsRepository.addingOnBoardingScreenData();

      emit(AuthenticationUnauthenticated());
    });

    on<LoggedIn>((event, emit) async {
      emit(AuthenticationLoading());

      await loginDetailsRepository.persistToken(event.loginData);

      emit(AuthenticationAuthenticated(loginData: event.loginData));
    });

    on<LoggedOutAuthenticationEvent>((event, emit) async {
      emit(AuthenticationLoading());
      await loginDetailsRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    });
  }
}
