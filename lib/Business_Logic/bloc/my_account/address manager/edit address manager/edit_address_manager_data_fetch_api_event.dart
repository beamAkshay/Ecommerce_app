part of 'edit_address_manager_data_fetch_api_bloc.dart';

abstract class EditAddressManagerDataFetchApiEvent extends Equatable {
  const EditAddressManagerDataFetchApiEvent();

  @override
  List<Object> get props => [];
}

class LoadEditAddressManagerDataFetchApi
    extends EditAddressManagerDataFetchApiEvent {

  final String addressId;
  final String token;

  const LoadEditAddressManagerDataFetchApi(
      { required this.addressId,required this.token});

  @override
  List<Object> get props => [addressId,token];
}

class AddCustomerAddressEvent extends EditAddressManagerDataFetchApiEvent {
  final AddressData addressData;
  final String token;

  const AddCustomerAddressEvent(this.addressData,this.token);

  @override
  List<Object> get props => [addressData,token];
}

class UpdateCustomerAddressEvent extends EditAddressManagerDataFetchApiEvent {
  final String addressId;
  final AddressData addressData;
  final String token;

  const UpdateCustomerAddressEvent({
    required this.addressId, required this.addressData,required this.token
  });

  @override
  List<Object> get props => [addressId,token];
}
