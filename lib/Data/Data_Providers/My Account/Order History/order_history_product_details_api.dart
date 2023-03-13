import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history.dart';
import 'package:unicorn_store/constant/constant.dart';

class OrderHistoryProductDetailsApi {
//This will load all the history of user orders
  Future<OrderHistory> getOrderHistoryProductDetails(String token) async {
    var response = await http.get(
      Uri.parse("$kDefaultBaseUrl/ordered_items_history"),
      headers: {
        "Content-Type": "application/json",
        "X-Auth-Token": token,
        "Connection": "keep-alive"
      },
    );

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = OrderHistory.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
