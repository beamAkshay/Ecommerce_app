import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/save%20guest%20user%20address/guest_user_address.dart';
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/save%20guest%20user%20address/guest_user_address_response.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';

part 'save_guest_user_details_event.dart';
part 'save_guest_user_details_state.dart';

class SaveGuestUserDetailsBloc
    extends Bloc<SaveGuestUserDetailsEvent, SaveGuestUserDetailsState> {
  final CheckoutRepository checkoutRepository = CheckoutRepository();
  SaveGuestUserDetailsBloc() : super(SaveGuestUserDetailsInitial()) {
    on<SaveGuestUserDetails>((event, emit) async {
      try {
        emit(SaveGuestUserDetailsLoading());
        final saveGuestUserAddressResponse = await checkoutRepository
            .saveGuestUserAddress(event.guestUserAddress);

        if (saveGuestUserAddressResponse.status!) {
          emit(SaveGuestUserDetailsLoaded(saveGuestUserAddressResponse));
        } else {
          emit(const SaveGuestUserDetailsFailure("Something went wrong"));
        }
      } catch (e) {
        emit(SaveGuestUserDetailsFailure(e.toString()));
      }
    });
  }
}
