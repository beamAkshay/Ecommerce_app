import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unicorn_store/Data/Models/Filter/filter_data.dart';

import '../../../constant/constant.dart';
import '../../Models/Filter/Filter Product Details/filter_product_info.dart';
import '../../Models/Filter/Filter Product List/filter_product_list.dart';

class FilterProductApi {
  Future<FilterData> getFilterDetails(
      Map<String, dynamic> data, String categorySlug) async {
    // Map<String, dynamic> data = {
    //   "limit_per_page": "100",
    //   "order_by": "name",
    //   "skip": "0",
    //   "sort": "0",
    //   "filter_text": ""
    // };
    String body = json.encode(data);
    log(categorySlug);
    log(body);

    var response = await http.post(
        Uri.parse(
            "$kDefaultBaseUrl/attribute/get_category/products/$categorySlug"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = FilterData.fromJson(decode);

      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<FilterProductList> getFilterProductDetails(
      Map<String, dynamic> selectedAttribute, String categorySlug) async {
    // Map<String, dynamic> data = {
    //   "limit_per_page": "100",
    //   "order_by": "name",
    //   "skip": "0",
    //   "sort": "0",
    //   "filter_text": "",
    //   "attributes": selectedAttribute
    // };
    log(categorySlug);

    String body = json.encode(selectedAttribute);
    var response = await http.post(
        Uri.parse(
            "$kDefaultBaseUrl/attribute/get_category/products/$categorySlug"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = FilterProductList.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<FilterProductInfo> getSingleFilterProductDetails(
      String productSlug, String token) async {
    var response = await http.get(
      Uri.parse("$kDefaultBaseUrl/attribute/get_product/$productSlug"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "X-Auth-Token": token,
      },
    );
    log(productSlug);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = FilterProductInfo.fromJson(decode);

      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
