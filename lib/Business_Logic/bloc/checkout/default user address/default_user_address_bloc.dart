import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default__addreses_field_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default_address_data.dart';
import 'package:unicorn_store/Data/Repositories/checkout/checkout_repository.dart';

part 'default_user_address_event.dart';
part 'default_user_address_state.dart';

class DefaultUserAddressBloc
    extends Bloc<DefaultUserAddressEvent, DefaultUserAddressState> {
  final CheckoutRepository checkoutRepository = CheckoutRepository();
  DefaultUserAddressBloc() : super(DefaultUserAddressInitial()) {
    on<LoadUserDefaultAddress>((event, emit) async {
      try {
        emit(DefaultUserAddressLoading());
        final defaultAddressData =
            await checkoutRepository.getUserDefaultAddress(event.token);
    
        if (defaultAddressData.status!) {
          emit(DefaultUserAddressLoaded(defaultAddressData));
        } else {
          emit(DefaultUserAddressNotFound());
        }
      } catch (e) {
        //  print(e);
        emit(DefaultUserAddressFailure(e.toString()));
      }
    });

    on<UpdateDefaultBillingAddress>((event, emit) async {
      try {
        emit(DefaultUserAddressLoading());
        final updatedAddressData = await checkoutRepository
            .updateBillingAddress(event.addressFieldData, event.token);
     
        if (updatedAddressData["status"]) {
          emit(DefaultUserAddressUpdated(
              updatedAddressData, event.addressFieldData));
        } else {
          emit(const DefaultUserAddressUpdateFailure(
              "Billing address is not updated"));
        }
      } catch (e) {
        // print(e);
        emit(DefaultUserAddressUpdateFailure(e.toString()));
      }
    });

    on<UpdateDefaultShippingAddress>((event, emit) async {
      if (event.billAddressSameAsShipping) {
        try {
          emit(const DefaultUserBillingAndShippingAddressSameLoading());
          final updatedAddressData = await checkoutRepository
              .updateShippingAddress(event.addressFieldData, event.token);
       
          if (updatedAddressData["status"]) {
            emit(DefaultUserBillingAndShippingAddressSameUpdated(updatedAddressData));
          } else {
            emit(const DefaultUserShippingAddressUpdateFailure(
                "Shipping address is not updated"));
          }
        } catch (e) {
          // print(e);
          emit(DefaultUserBillingAndShippingAddressSameFailure(e.toString()));
        }
      } else {
        try {
          emit(const DefaultUserShippingAddressUpdateLoading());
          final updatedAddressData = await checkoutRepository
              .updateShippingAddress(event.addressFieldData, event.token);
          if (updatedAddressData["status"]) {
            emit(DefaultUserShippingAddressUpdated(updatedAddressData));
          } else {
            emit(const DefaultUserShippingAddressUpdateFailure(
                "Billing address is not updated"));
          }
        } catch (e) {
          // print(e);
          emit(DefaultUserShippingAddressUpdateFailure(e.toString()));
        }
      }
    });
  }
}
