part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final LoginData loginData;

  const AuthenticationAuthenticated({required this.loginData});

  
  @override
  List<Object> get props => [loginData];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticatedOnboardingIncomplete extends AuthenticationState {}

class AuthenticatedUserLoggedout extends AuthenticationState {
  final LogoutDetails? logoutDetails;

  const AuthenticatedUserLoggedout({
    this.logoutDetails,
  });
}

class AuthenticationLoading extends AuthenticationState {}
