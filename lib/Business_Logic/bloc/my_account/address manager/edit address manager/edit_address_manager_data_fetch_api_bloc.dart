import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/address_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/edit_address_list.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Address%20Manager/address_manager_details_repository.dart';

part 'edit_address_manager_data_fetch_api_event.dart';
part 'edit_address_manager_data_fetch_api_state.dart';

class EditAddressManagerDataFetchApiBloc extends Bloc<
    EditAddressManagerDataFetchApiEvent, EditAddressManagerDataFetchApiState> {
  EditAddressManagerDataFetchApiBloc()
      : super(EditAddressManagerDataFetchApiInitial()) {
    final AddressManagerDetailsRepository addressManagerDetailsRepository =
        AddressManagerDetailsRepository();

    on<LoadEditAddressManagerDataFetchApi>((event, emit) async {
      try {
        emit(EditAddressManagerDataFetchApiLoading());
        final addressDetails = await addressManagerDetailsRepository
            .getAddressManagerDetailsEdit( event.addressId,event.token);
        await Future.delayed(const Duration(seconds: 2));
        emit(EditAddressManagerDataFetchApiLoaded(addressDetails));
      } catch (e) {
        emit(EditAddressManagerDataFetchApiError(e.toString()));
      }
    });

    
    on<AddCustomerAddressEvent>((event, emit) async {
      try {
        emit(EditAddressManagerDataFetchApiLoading());
        final addUserAddressResponse =
            await addressManagerDetailsRepository.addUserAddress(event.addressData,event.token);

        emit(AddCustomerAddressSuccess(addUserAddressResponse));
      } catch (e) {
        emit(EditAddressManagerDataFetchApiError(e.toString()));
      }
    });

     on<UpdateCustomerAddressEvent>((event, emit) async {
      try {
                emit(EditAddressManagerDataFetchApiLoading());

        final updateUserAddressResponse =
            await addressManagerDetailsRepository
                .updateUserAddress(event.addressId,event.addressData,event.token);

        emit(UpdateCustomerAddressSuccess(updateUserAddressResponse));
      } catch (e) {
        emit(EditAddressManagerDataFetchApiError(e.toString()));
      }
    });

  
  }
}
