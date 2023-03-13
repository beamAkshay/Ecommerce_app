// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names


import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history_product_contents.dart';

class OrderHistoryProduct {
  final int? order_item_id;
  final int? order_id;
  final int? product_id;
  final int? quantity;
  final OrderHistoryProductContents? contents;
  final int? prebook;
  final int? buyback;

  OrderHistoryProduct({
    this.order_item_id,
    this.order_id,
    this.product_id,
    this.quantity,
    this.contents,
    this.prebook,
    this.buyback,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'order_item_id': order_item_id,
      'order_id': order_id,
      'product_id': product_id,
      'quantity': quantity,
      'contents': contents?.toJson(),
      'prebook': prebook,
      'buyback': buyback,
    };
  }

  factory OrderHistoryProduct.fromJson(Map<String, dynamic> map) {
    return OrderHistoryProduct(
      order_item_id:
          map['order_item_id'] != null ? map['order_item_id'] as int : null,
      order_id: map['order_id'] != null ? map['order_id'] as int : null,
      product_id: map['product_id'] != null ? map['product_id'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      contents: map['contents'] != null
          ? OrderHistoryProductContents.fromJson(
              map['contents'] as Map<String, dynamic>)
          : null,
      prebook: map['prebook'] != null ? map['prebook'] as int : null,
      buyback: map['buyback'] != null ? map['buyback'] as int : null,
    );
  }

  @override
  String toString() {
    return 'OrderHistoryProductContents(order_item_id: $order_item_id, order_id: $order_id, product_id: $product_id, quantity: $quantity, contents: $contents, prebook: $prebook, buyback: $buyback)';
  }
}
