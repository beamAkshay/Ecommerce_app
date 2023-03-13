import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:unicorn_store/Data/Models/theme/theme_color.dart';

import '../../../constant/constant.dart';

class ThemeColorApi {
  Future<ThemeColor> getThemeColor() async {
    var response =
        await http.get(Uri.parse("$kDefaultBaseUrl/get_theme/customer_area"));

    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var data = ThemeColor.fromJson(decode);

      return data;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
