import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:unicorn_store/constant/constant.dart';

import '../../Models/Category/NewCategory/category_data.dart';

class CategoryServiceApi {
  Future<List<CategoryData>> getCategories() async {
    var response =
        await http.get(Uri.parse("$kDefaultBaseUrl/category_navbar"));

    log(response.statusCode.toString());

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<CategoryData> category = List<CategoryData>.from(
          l.map((model) => CategoryData.fromJson(model)));

      return category;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
