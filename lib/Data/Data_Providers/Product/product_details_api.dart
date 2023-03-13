import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/product_info_data.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product/single_product_data.dart';
import 'package:unicorn_store/constant/constant.dart';

class ProductDetailsServiceApi {
  Future<ProductInfoData> getProductDetails(String productNameSlug) async {
    var response = await http.get(
        Uri.parse("$kDefaultBaseUrl/attribute/get_category/$productNameSlug"));
    log(productNameSlug);
    try {
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body);
        var data = ProductInfoData.fromJson(decode);

        return data;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception(response.statusCode);
  }

  Future<SingleProductData> getProductPageDetails(
      List<dynamic> productValue, String productTypeId, String token) async {
    String url = "$kDefaultBaseUrl/attribute/get_product";
    //Empty product object
    // Product product=Product();

    Map data = {
      "primary": productTypeId,
      "attribute": [
        {"attribute_type": "multiselect", "attribute_id": productValue}
      ]
    };

    String body = json.encode(data);

    log(body);

    var response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "X-Auth-Token": token,
        },
        body: body);

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = SingleProductData.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
