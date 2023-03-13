import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/account_info_details.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/address_details.dart';
import 'package:unicorn_store/constant/constant.dart';

class AccountInformationDetailsApi {
  //Fetching Account Information
  Future<AccountInfoDetails> getAccountDetails(
    String token) async {
    String url = "$kDefaultBaseUrl/account_info";

   
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "X-Auth-Token": token,
          "Connection": "keep-alive"
        },
      );
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        var data = AccountInfoDetails.fromJson(decode);
        return data;
      } else {
        throw Exception(response.statusCode);
      }
    
  }

  //Updating Account Information
  Future<Map<String, dynamic>> updateUserAccountInformation(
      String token, AddressDetails? addressData) async {
    String url = "$kDefaultBaseUrl/update_account_info";

    String body = json.encode(addressData);

    var response = await http.post(Uri.parse(url),
        headers: {
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
}
