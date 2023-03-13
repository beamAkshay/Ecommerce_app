part of 'set_default_address_bloc.dart';

abstract class SetDefaultAddressState extends Equatable {
  const SetDefaultAddressState();
  
  @override
  List<Object> get props => [];
}

class SetDefaultAddressInitial extends SetDefaultAddressState {}

class SetDefaultAddressError
    extends SetDefaultAddressState {
  final String? message;
  const SetDefaultAddressError(this.message);
}

class SetDefaultAddressSuccess extends SetDefaultAddressState {
  final Map<String, dynamic> addressSetResponse;
  final AddressList addressList;

  const SetDefaultAddressSuccess(this.addressSetResponse, this.addressList);
}