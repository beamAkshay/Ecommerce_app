part of 'set_default_address_bloc.dart';

abstract class SetDefaultAddressEvent extends Equatable {
  const SetDefaultAddressEvent();

  @override
  List<Object> get props => [];
}

class SetDefaultAddresssDetails extends SetDefaultAddressEvent {
  
  final String addressId;
  final String addressType;
  final String token;

  const SetDefaultAddresssDetails(
      {
      required this.addressId,
      required this.addressType,required this.token});

  @override
  List<Object> get props => [ addressId, addressType,token];
}