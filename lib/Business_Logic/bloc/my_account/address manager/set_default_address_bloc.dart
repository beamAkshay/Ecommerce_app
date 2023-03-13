import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/address_list.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Address%20Manager/address_manager_details_repository.dart';

part 'set_default_address_event.dart';
part 'set_default_address_state.dart';

class SetDefaultAddressBloc extends Bloc<SetDefaultAddressEvent, SetDefaultAddressState> {
  SetDefaultAddressBloc() : super(SetDefaultAddressInitial()) {
     final AddressManagerDetailsRepository addressManagerDetailsRepository =
        AddressManagerDetailsRepository();
      on<SetDefaultAddresssDetails>((event, emit) async {
      try {
        final setDefaultAddressResponse =
            await addressManagerDetailsRepository.setDefaultAddress(
              event.addressId, event.addressType,event.token);
        final addressDetails = await addressManagerDetailsRepository
            .getAddressManagerDetails(event.token);
        emit(
            SetDefaultAddressSuccess(setDefaultAddressResponse, addressDetails));
      } catch (e) {
        emit(SetDefaultAddressError(e.toString()));
      }
    });
  }
}
