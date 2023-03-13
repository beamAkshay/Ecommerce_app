import 'package:unicorn_store/Data/Data_Providers/Product/product_details_api.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/product_info_data.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product/single_product_data.dart';

class ProductDetailsRepository {
  final _productDetailsServiceApi = ProductDetailsServiceApi();

  Future<ProductInfoData> getProductDetails(String productNameSlug) {
    return _productDetailsServiceApi.getProductDetails(productNameSlug);
  }

  Future<SingleProductData> getProductPageDetails(
      List<dynamic> productValue, String productTypeId, String token) {
    return _productDetailsServiceApi.getProductPageDetails(
        productValue, productTypeId, token);
  }
}
