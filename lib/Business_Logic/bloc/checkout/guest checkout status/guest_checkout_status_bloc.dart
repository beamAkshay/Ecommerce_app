import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/guest_checkout_status.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';

part 'guest_checkout_status_event.dart';
part 'guest_checkout_status_state.dart';

class GuestCheckoutStatusBloc
    extends Bloc<GuestCheckoutStatusEvent, GuestCheckoutStatusState> {
  final CheckoutRepository checkoutRepository = CheckoutRepository();
  GuestCheckoutStatusBloc() : super(GuestCheckoutStatusInitial()) {
    on<CheckGuestCheckoutStatus>((event, emit) async {
      try {
        emit(GuestCheckoutStatusLoading());
        final guestCheckoutStatus =
            await checkoutRepository.guestCheckoutStatus();
        if (guestCheckoutStatus.status) {
          emit(GuestCheckoutStatusSuccess(guestCheckoutStatus));
        } else {
          const GuestCheckoutStatusFailure("Something went wrong");
        }
      } catch (e) {
        GuestCheckoutStatusFailure(e.toString());
      }
    });
  }
}
