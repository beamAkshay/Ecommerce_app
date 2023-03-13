part of 'address_manager_details_api_fetch_bloc.dart';

abstract class AddressManagerDetailsApiFetchEvent extends Equatable {
  const AddressManagerDetailsApiFetchEvent();

  @override
  List<Object> get props => [];
}

class LoadAddressDetailsApiFetch extends AddressManagerDetailsApiFetchEvent {
 
  final String token;

  const LoadAddressDetailsApiFetch({required this.token});

  @override
  List<Object> get props => [token];
}


class DeleteCustomerAddressEvent extends AddressManagerDetailsApiFetchEvent {
  final String addressId;
  
  final String token;

  const DeleteCustomerAddressEvent(
      {required this.addressId,required this.token});

  @override
  List<Object> get props => [addressId, token];
}



