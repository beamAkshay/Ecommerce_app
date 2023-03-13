part of 'account_information_api_fetch_bloc.dart';

abstract class AccountInformationApiFetchEvent extends Equatable {
  const AccountInformationApiFetchEvent();

  @override
  List<Object> get props => [];
}

class LoadAccountDetailsApiFetch extends AccountInformationApiFetchEvent {

  final String token;

  const LoadAccountDetailsApiFetch(
      { required this.token});

  @override
  List<Object> get props => [token];
}

class UpdateCustomerAccountDetailsEvent
    extends AccountInformationApiFetchEvent {
  
  final AddressDetails addressData;
  final String token;

  const UpdateCustomerAccountDetailsEvent(
      {
      required this.addressData,
      required this.token});

  @override
  List<Object> get props => [addressData, token];
}
