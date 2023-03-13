part of 'edit_address_manager_data_fetch_api_bloc.dart';

abstract class EditAddressManagerDataFetchApiState extends Equatable {
  const EditAddressManagerDataFetchApiState();

  @override
  List<Object> get props => [];
}

class EditAddressManagerDataFetchApiInitial
    extends EditAddressManagerDataFetchApiState {}

class EditAddressManagerDataFetchApiLoading
    extends EditAddressManagerDataFetchApiState {}

class EditAddressManagerDataFetchApiLoaded
    extends EditAddressManagerDataFetchApiState {
  final EditAddressList editAddressList;

  const EditAddressManagerDataFetchApiLoaded(this.editAddressList);
}

class AddCustomerAddressSuccess extends EditAddressManagerDataFetchApiState {
  final Map<String, dynamic> addAddressResponse;

  const AddCustomerAddressSuccess(this.addAddressResponse);
}


class UpdateCustomerAddressSuccess extends EditAddressManagerDataFetchApiState {
  final Map<String, dynamic> updateAddressResponse;

  const UpdateCustomerAddressSuccess(this.updateAddressResponse);
}

class EditAddressManagerDataFetchApiError
    extends EditAddressManagerDataFetchApiState {
  final String? message;
  const EditAddressManagerDataFetchApiError(this.message);
}

