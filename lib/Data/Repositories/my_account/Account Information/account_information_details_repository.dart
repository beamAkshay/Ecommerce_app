import 'package:unicorn_store/Data/Data_Providers/My%20Account/Account%20Information/account_information_details_api.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/account_info_details.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/address_details.dart';

class AccountInformationDetailsRepository {
  final _accountInformationDetails = AccountInformationDetailsApi();

  //Load Customer list of address
  Future<AccountInfoDetails> getAccountDetails(
       String token) {
    return _accountInformationDetails.getAccountDetails( token);
  }

  //Update Customer Information
  Future<Map<String, dynamic>> updateUserAccountInformation(
      String token, AddressDetails? addressData) {
    return _accountInformationDetails.updateUserAccountInformation(
         token, addressData);
  }
}
