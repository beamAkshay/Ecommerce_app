// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';

class CartProductDataList {
  final List<CartProductData>? cart_items;
  final bool? status;
  final String? message;

  CartProductDataList({
    this.cart_items,
    this.status,
    this.message,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cart_items': cart_items!.map((x) => x.toJson()).toList(),
      'status': status,
      'message': message,
    };
  }

  factory CartProductDataList.fromJson(Map<String, dynamic> map) {
    return CartProductDataList(
      cart_items: map['cart_items'] != null
          ? List<CartProductData>.from(
              (map['cart_items'] as List<dynamic>).map<CartProductData?>(
                (x) => CartProductData.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      status: map['status'] != null ? map['status'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  @override
  String toString() =>
      'CartProductDataList(cart_items: $cart_items, status: $status, message: $message)';
}
