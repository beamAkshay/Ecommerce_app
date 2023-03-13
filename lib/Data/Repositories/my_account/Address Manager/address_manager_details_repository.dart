import 'package:unicorn_store/Data/Data_Providers/My%20Account/Address%20Manager/address_manager_details_api.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Country%20Dropdown/country_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/address_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/edit_address_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/State/state_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/address_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/search_zip_address.dart';

class AddressManagerDetailsRepository {
  final _addressManagerDetailsApi = AddressManagerDetailsApi();

  //Load Customer list of address
  Future<AddressList> getAddressManagerDetails(String token) {
    return _addressManagerDetailsApi.getAddressManagerDetails(token);
  }

  //Load Customer address based on address Id
  Future<EditAddressList> getAddressManagerDetailsEdit(
       String addressID,String token) {
    return _addressManagerDetailsApi.getAddressManagerDetailsEdit(
         addressID,token);
  }

  //This will set defaultShipping and defaultBilling
  Future<Map<String, dynamic>> setDefaultAddress(
  String addressId, String addressType,String token) {
    return _addressManagerDetailsApi.setDefaultAddress(
       addressId, addressType,token);
  }

  //This will delete customer address based on address id
  Future<Map<String, dynamic>> deleteUserAddress(String addressId,String token) {
    return _addressManagerDetailsApi.deleteUserAddress(addressId,token);
  }

  //This is post request for adding new user address
  Future<Map<String, dynamic>> addUserAddress(AddressData? addressData,String token) async {
    return _addressManagerDetailsApi.addUserAddress(addressData,token);
  }

  //This is post request for Updating  user address
  Future<Map<String, dynamic>> updateUserAddress(String addressId,AddressData? addressData,String token) async {
    return _addressManagerDetailsApi.updateUserAddress(addressId,addressData,token);
  }

  //This will load address based on pincode
  Future<SearchZipAddress> searchPincodeAddress(String pinCode,String token) async {
    return _addressManagerDetailsApi.searchPincodeAddress(pinCode,token);
  }

  //This will load list of country
  Future<CountryList> getCountryList(String token) async {
    return _addressManagerDetailsApi.getCountryList(token);
  }

  //This will load list of State
  Future<StateList> getStateList(String? countryId,String token) async {
    return _addressManagerDetailsApi.getStateList(countryId,token);
  }
}
