part of 'default_user_address_bloc.dart';

abstract class DefaultUserAddressState extends Equatable {
  const DefaultUserAddressState();

  @override
  List<Object> get props => [];
}

class DefaultUserAddressInitial extends DefaultUserAddressState {}

class DefaultUserAddressLoading extends DefaultUserAddressState {}

class DefaultUserAddressLoaded extends DefaultUserAddressState {
  final DefaultAddressData defaultAddressData;

  const DefaultUserAddressLoaded(this.defaultAddressData);
}

class DefaultUserAddressUpdated extends DefaultUserAddressState {
  final Map<String, dynamic> defaultAddressData;
   final DefaultAddressFieldData addressFieldData;

  const DefaultUserAddressUpdated(this.defaultAddressData,this.addressFieldData);
}

class DefaultUserAddressUpdateFailure extends DefaultUserAddressState {
  final String message;
  const DefaultUserAddressUpdateFailure(this.message);
}
 
class DefaultUserShippingAddressUpdateLoading extends DefaultUserAddressState {
 
  const DefaultUserShippingAddressUpdateLoading();
}

class DefaultUserShippingAddressUpdated extends DefaultUserAddressState {
  final Map<String, dynamic> defaultAddressData;

  const DefaultUserShippingAddressUpdated(this.defaultAddressData);
}

class DefaultUserShippingAddressUpdateFailure extends DefaultUserAddressState {
  final String message;
  const DefaultUserShippingAddressUpdateFailure(this.message);
}

class DefaultUserAddressNotFound extends DefaultUserAddressState {}

class DefaultUserAddressFailure extends DefaultUserAddressState {
  final String message;
  const DefaultUserAddressFailure(this.message);
}


//###########################  creating state for billing address=shipping addresss
class DefaultUserBillingAndShippingAddressSameLoading extends DefaultUserAddressState {
 
  const DefaultUserBillingAndShippingAddressSameLoading();
}

class DefaultUserBillingAndShippingAddressSameUpdated extends DefaultUserAddressState {
  final Map<String, dynamic> defaultAddressData;

  const DefaultUserBillingAndShippingAddressSameUpdated(this.defaultAddressData);
}

class DefaultUserBillingAndShippingAddressSameFailure extends DefaultUserAddressState {
  final String message;
  const DefaultUserBillingAndShippingAddressSameFailure(this.message);
}
