part of 'save_guest_user_details_bloc.dart';

abstract class SaveGuestUserDetailsEvent extends Equatable {
  const SaveGuestUserDetailsEvent();

  @override
  List<Object> get props => [];
}

class SaveGuestUserDetails extends SaveGuestUserDetailsEvent {
  final GuestUserAddress guestUserAddress;

  const SaveGuestUserDetails(this.guestUserAddress);
}
