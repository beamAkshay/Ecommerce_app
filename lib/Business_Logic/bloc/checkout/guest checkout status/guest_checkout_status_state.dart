part of 'guest_checkout_status_bloc.dart';

abstract class GuestCheckoutStatusState extends Equatable {
  const GuestCheckoutStatusState();

  @override
  List<Object> get props => [];
}

class GuestCheckoutStatusInitial extends GuestCheckoutStatusState {}

class GuestCheckoutStatusLoading extends GuestCheckoutStatusState {}

class GuestCheckoutStatusSuccess extends GuestCheckoutStatusState {
  final GuestCheckoutStatus guestCheckoutStatus;
  const GuestCheckoutStatusSuccess(this.guestCheckoutStatus);
}

class GuestCheckoutStatusFailure extends GuestCheckoutStatusState {
  final String message;

  const GuestCheckoutStatusFailure(this.message);
}
