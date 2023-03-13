part of 'default_user_address_bloc.dart';

abstract class DefaultUserAddressEvent extends Equatable {
  const DefaultUserAddressEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDefaultAddress extends DefaultUserAddressEvent {
  final String token;
  const LoadUserDefaultAddress(this.token);
}

class UpdateDefaultBillingAddress extends DefaultUserAddressEvent {
  final DefaultAddressFieldData addressFieldData;
  final String token;
  const UpdateDefaultBillingAddress(this.addressFieldData, this.token);
}

class UpdateDefaultShippingAddress extends DefaultUserAddressEvent {
  final DefaultAddressFieldData addressFieldData;
  final String token;
  final bool billAddressSameAsShipping;
  const UpdateDefaultShippingAddress(this.addressFieldData, this.token,this.billAddressSameAsShipping);
}