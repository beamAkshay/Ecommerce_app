import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:unicorn_store/Data/Models/banner/banner_details.dart';

import '../../../constant/constant.dart';

class BannerDetailsApi {
  Future<BannerDetails> viewHomePageBanner() async {
    var response = await http.get(
      Uri.parse("$kDefaultBaseUrl/banners?banner_collection_id=1"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    //  print("body:${response.body} responseCode:${response.request} header:${response.headers}");
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = BannerDetails.fromJson(decode);
      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
