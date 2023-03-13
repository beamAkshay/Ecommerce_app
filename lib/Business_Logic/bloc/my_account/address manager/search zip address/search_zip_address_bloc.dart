import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/search_zip_address.dart';
import 'package:unicorn_store/Data/Repositories/my_account/Address%20Manager/address_manager_details_repository.dart';

part 'search_zip_address_event.dart';
part 'search_zip_address_state.dart';

class SearchZipAddressBloc
    extends Bloc<SearchZipAddressEvent, SearchZipAddressState> {
  SearchZipAddressBloc() : super(SearchZipAddressInitial()) {
    final AddressManagerDetailsRepository addressManagerDetailsRepository =
        AddressManagerDetailsRepository();

    on<LoadSearchZipAddress>((event, emit) async {
      try {
        emit(SearchZipAddressLoading());
        final addressDetails = await addressManagerDetailsRepository
            .searchPincodeAddress(event.pincode,event.token);
        emit(SearchZipAddressLoaded(addressDetails));
      } catch (e) {
        emit(SearchZipAddressError(e.toString()));
      }
    });
  }
}
