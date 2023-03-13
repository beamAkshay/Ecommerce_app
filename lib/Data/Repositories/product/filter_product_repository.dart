import 'package:unicorn_store/Data/Data_Providers/Product/filter_product_api.dart';
import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20Details/filter_product_info.dart';
import 'package:unicorn_store/Data/Models/Filter/filter_data.dart';

import '../../Models/Filter/Filter Product List/filter_product_list.dart';

class FilterProductRepository {
  final filterProductApi = FilterProductApi();

  Future<FilterData> getFilterDetails(
      Map<String, dynamic> data, String categorySlug) {
    return filterProductApi.getFilterDetails(data, categorySlug);
  }

  Future<FilterProductList> getFilterProductDetails(
      Map<String, dynamic> selectedAttribute, String categorySlug) {
    return filterProductApi.getFilterProductDetails(
        selectedAttribute, categorySlug);
  }

  Future<FilterProductInfo> getSingleFilterProductDetails(
      String productSlug, String token) {
    return filterProductApi.getSingleFilterProductDetails(productSlug, token);
  }
}
