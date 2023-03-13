import 'package:unicorn_store/Data/Data_Providers/Cart/add_to_cart_api.dart';
import 'package:unicorn_store/Data/Models/Cart/total_product_count.dart';
import 'package:unicorn_store/Data/Models/Service%20Check%20Pincode/pincode_service_check_data.dart';

import '../../Models/Cart/Add Product To Cart/adding_product_to_cart.dart';
import '../../Models/Cart/View Cart/card_product_data_list.dart';

class AddToCartRepository {
  final addToCartApi = AddToCartApi();

  Future<AddingProductToCart> addProductToCart(int productId, String token) {
    return addToCartApi.addProductToCart(productId, token);
  }

  Future<CartProductDataList> viewCartProductList(String token) {
    return addToCartApi.viewCartProductList(token);
  }

  Future<TotalProductCount> totalCartProductCount(String token) {
    return addToCartApi.totalCartProductCount(token);
  }

  Future<Map<String, dynamic>> updateCartItem(
      int cartItemId, String quantity, String token) {
    return addToCartApi.updateCartItem(cartItemId, quantity, token);
  }

  Future<Map<String, dynamic>> removeCartItem(int cartItemId, String token) {
    return addToCartApi.removeCartItem(cartItemId, token);
  }

  Future<Map<String, dynamic>> moveToWishlistCartItem(
      int cartItemId, String token) {
    return addToCartApi.moveToWishlistCartItem(cartItemId, token);
  }

  Future<PinCodeServiceCheck> productServiceCheck(String pincode) {
    return addToCartApi.productServiceCheck(pincode);
  }

  Future<void> emptyCart(String token) {
    return addToCartApi.emptyCart(token);
  }

  Future<void> updateOrderValue(String token) {
    return addToCartApi.updateOrderValue(token);
  }
}
