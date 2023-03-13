part of 'address_manager_details_api_fetch_bloc.dart';

abstract class AddressManagerDetailsApiFetchState extends Equatable {
  const AddressManagerDetailsApiFetchState();

  @override
  List<Object> get props => [];
}

class AddressManagerDetailsApiFetchInitial
    extends AddressManagerDetailsApiFetchState {}

class AddressManagerDetailsApiFetchLoading
    extends AddressManagerDetailsApiFetchState {}

class AddressManagerDetailsApiFetchLoaded
    extends AddressManagerDetailsApiFetchState {
  final AddressList addressList;

  const AddressManagerDetailsApiFetchLoaded(this.addressList);
}

class AddressManagerDetailsApiFetchError
    extends AddressManagerDetailsApiFetchState {
  final String? message;
  const AddressManagerDetailsApiFetchError(this.message);
}

class DeleteCustomerAddressSuccess extends AddressManagerDetailsApiFetchState {
  final Map<String, dynamic> deleteAddressResponse;
  final AddressList addressList;

  const DeleteCustomerAddressSuccess(
      this.addressList, this.deleteAddressResponse);
}

