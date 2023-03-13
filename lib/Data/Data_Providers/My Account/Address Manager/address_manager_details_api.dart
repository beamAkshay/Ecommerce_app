import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Country%20Dropdown/country_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/address_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/edit_address_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/State/state_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/address_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/search_zip_address.dart';
import 'package:unicorn_store/constant/constant.dart';

class AddressManagerDetailsApi {
  final _baseUrl = "$kDefaultBaseUrl/address_bank";

  //This will Fetch List of user Address Details
  Future<AddressList> getAddressManagerDetails(String token) async {
    var response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        "Content-Type": "application/json",
        "X-Auth-Token": token,
        "Connection": "keep-alive"
      },
    );

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = AddressList.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This will load user address based address id
  Future<EditAddressList> getAddressManagerDetailsEdit(
      String addressId, String token) async {
    var response = await http.get(
      Uri.parse("$kDefaultBaseUrl/edit_address_bank/?address_id=$addressId"),
      headers: {
        "Content-Type": "application/json",
        "X-Auth-Token": token,
        "Connection": "keep-alive"
      },
    );
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = EditAddressList.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This is post request for setting default billing and default shipping for user addresss
  Future<Map<String, dynamic>> setDefaultAddress(
      String addressId, String addressType, String token) async {
    String url = "$kDefaultBaseUrl/set_default_address";

    Map data = {
      'address_id': addressId,
      'address_type': addressType,
    };
    String body = json.encode(data);
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "X-Auth-Token": token,
          "Connection": "keep-alive"
        },
        body: body);

    if (response.statusCode == 200) {
      var responseDecode = jsonDecode(response.body);

      return responseDecode;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This is get request for deleting user address based on address id
  Future<Map<String, dynamic>> deleteUserAddress(
      String addressId, String token) async {
    String url = "$kDefaultBaseUrl/delete_address_bank/$addressId";

    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "X-Auth-Token": token,
        "Connection": "keep-alive"
      },
    );
    if (response.statusCode == 200) {
      var responseDecode = jsonDecode(response.body);
      return responseDecode;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This is post request for Updating  user address
  Future<Map<String, dynamic>> updateUserAddress(
      String addressId, AddressData? addressData, String token) async {
    String url = "$kDefaultBaseUrl/update_address_bank";

    Map<String, dynamic> data = {
      "address_id": addressId,
      "firstname": addressData!.fieldDataEditAddress!.firstname,
      "lastname": addressData.fieldDataEditAddress!.lastname,
      "email": addressData.fieldDataEditAddress!.email,
      "phone": addressData.fieldDataEditAddress!.phone,
      "address1": addressData.fieldDataEditAddress!.address1,
      "address2": addressData.fieldDataEditAddress!.address2,
      "city": addressData.fieldDataEditAddress!.city,
      "zip": addressData.fieldDataEditAddress!.zip,
      "zone": addressData.fieldDataEditAddress!.zone,
      "country": addressData.fieldDataEditAddress!.country,
      "country_code": addressData.fieldDataEditAddress!.countryCode,
      "country_id": addressData.fieldDataEditAddress!.countryId,
      "zone_id": addressData.fieldDataEditAddress!.zoneId
    };

    String body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "X-Auth-Token": token,
          "Connection": "keep-alive"
        },
        body: body);
    if (response.statusCode == 200) {
      var responseDecode = jsonDecode(response.body);
      return responseDecode;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This is post request for adding new user address
  Future<Map<String, dynamic>> addUserAddress(
      AddressData? addressData, String token) async {
    String url = "$kDefaultBaseUrl/add_address_bank";

    Map<String, dynamic> data = {
      "firstname": addressData!.fieldDataEditAddress!.firstname,
      "lastname": addressData.fieldDataEditAddress!.lastname,
      "email": addressData.fieldDataEditAddress!.email,
      "phone": addressData.fieldDataEditAddress!.phone,
      "address1": addressData.fieldDataEditAddress!.address1,
      "address2": addressData.fieldDataEditAddress!.address2,
      "city": addressData.fieldDataEditAddress!.city,
      "zip": addressData.fieldDataEditAddress!.zip,
      "zone": addressData.fieldDataEditAddress!.zone,
      "country": addressData.fieldDataEditAddress!.country,
      "country_code": addressData.fieldDataEditAddress!.countryCode,
      "country_id": addressData.fieldDataEditAddress!.countryId,
      "zone_id": addressData.fieldDataEditAddress!.zoneId
    };

    String body = json.encode(data);

    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "X-Auth-Token": token,
          "Connection": "keep-alive"
        },
        body: body);
    if (response.statusCode == 200) {
      var responseDecode = jsonDecode(response.body);
      return responseDecode;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This will load address based on pincode
  Future<SearchZipAddress> searchPincodeAddress(
      String pinCode, String token) async {
    String url = "$kDefaultBaseUrl/master_stores/$pinCode";

    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "X-Auth-Token": token,
        "Connection": "keep-alive"
      },
    );
    if (response.statusCode == 200) {
      var responseDecode = jsonDecode(response.body);
      var data = SearchZipAddress.fromJson(responseDecode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This will load list of country
  Future<CountryList> getCountryList(String token) async {
    String url = "$kDefaultBaseUrl/master_country";

    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "X-Auth-Token": token,
        "Connection": "keep-alive"
      },
    );
    if (response.statusCode == 200) {
      var responseDecode = jsonDecode(response.body);
      var data = CountryList.fromJson(responseDecode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  //This will load list of State
  Future<StateList> getStateList(String? countryId, String token) async {
    String url = "$kDefaultBaseUrl/master_state/$countryId";

    var response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "X-Auth-Token": token,
        "Connection": "keep-alive"
      },
    );
    if (response.statusCode == 200) {
      var responseDecode = jsonDecode(response.body);
      var data = StateList.fromJson(responseDecode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
