part of 'save_guest_user_details_bloc.dart';

abstract class SaveGuestUserDetailsState extends Equatable {
  const SaveGuestUserDetailsState();

  @override
  List<Object> get props => [];
}

class SaveGuestUserDetailsInitial extends SaveGuestUserDetailsState {}

class SaveGuestUserDetailsLoading extends SaveGuestUserDetailsState {}

class SaveGuestUserDetailsLoaded extends SaveGuestUserDetailsState {
  final GuestUserAddressResponse guestUserAddressResponse;
  const SaveGuestUserDetailsLoaded(this.guestUserAddressResponse);
}

class SaveGuestUserDetailsFailure extends SaveGuestUserDetailsState {
  final String message;
  const SaveGuestUserDetailsFailure(this.message);
}
