part of 'guest_checkout_status_bloc.dart';

abstract class GuestCheckoutStatusEvent extends Equatable {
  const GuestCheckoutStatusEvent();

  @override
  List<Object> get props => [];
}

class CheckGuestCheckoutStatus extends GuestCheckoutStatusEvent {}
