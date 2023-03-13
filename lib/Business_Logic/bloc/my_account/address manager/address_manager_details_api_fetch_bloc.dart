import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/address_list.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Address%20Manager/address_manager_details_repository.dart';

part 'address_manager_details_api_fetch_event.dart';
part 'address_manager_details_api_fetch_state.dart';

class AddressManagerDetailsApiFetchBloc extends Bloc<
    AddressManagerDetailsApiFetchEvent, AddressManagerDetailsApiFetchState> {
  AddressManagerDetailsApiFetchBloc()
      : super(AddressManagerDetailsApiFetchInitial()) {
    final AddressManagerDetailsRepository addressManagerDetailsRepository =
        AddressManagerDetailsRepository();

    on<LoadAddressDetailsApiFetch>((event, emit) async {
      try {
        emit(AddressManagerDetailsApiFetchLoading());
        final addressDetails = await addressManagerDetailsRepository
            .getAddressManagerDetails(event.token);
        if (addressDetails.status!) {
          emit(AddressManagerDetailsApiFetchLoaded(addressDetails));
        } else {
          emit(
              const AddressManagerDetailsApiFetchError("Something went wrong"));
        }
      } catch (e) {
        // print(e);
        emit(AddressManagerDetailsApiFetchError(e.toString()));
      }
    });

    on<DeleteCustomerAddressEvent>((event, emit) async {
      try {
        emit(AddressManagerDetailsApiFetchLoading());
        final deleteUserAddressResponse = await addressManagerDetailsRepository
            .deleteUserAddress(event.addressId, event.token);
        final addressDetails = await addressManagerDetailsRepository
            .getAddressManagerDetails(event.token);
        await Future.delayed(const Duration(seconds: 2));

        emit(DeleteCustomerAddressSuccess(
            addressDetails, deleteUserAddressResponse));
      } catch (e) {
        emit(AddressManagerDetailsApiFetchError(e.toString()));
      }
    });
  }
}
