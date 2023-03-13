part of 'account_information_api_fetch_bloc.dart';

abstract class AccountInformationApiFetchState extends Equatable {
  const AccountInformationApiFetchState();

  @override
  List<Object> get props => [];
}

class AccountInformationApiFetchInitial
    extends AccountInformationApiFetchState {}

class AccountInformationApiFetchLoading
    extends AccountInformationApiFetchState {}

class AccountInformationApiFetchLoaded extends AccountInformationApiFetchState {
  final AccountInfoDetails accountInfoDetails;

  const AccountInformationApiFetchLoaded(this.accountInfoDetails);
}

class UpdateCustomerAccountDetailsSuccess
    extends AccountInformationApiFetchState {
  final Map<String, dynamic> updateCustomerAccountDetailsResponse;

  const UpdateCustomerAccountDetailsSuccess(
      this.updateCustomerAccountDetailsResponse);
}

class AccountInformationApiFetchError extends AccountInformationApiFetchState {
  final String? message;
  const AccountInformationApiFetchError(this.message);
}
