// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_product_identifier_names, non_constant_identifier_names
class GuestUserProductData {
  final int? product_id;
  final int? quantity;
  GuestUserProductData({
    this.product_id,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'product_id': product_id,
      'quantity': quantity,
    };
  }

  factory GuestUserProductData.fromJson(Map<String, dynamic> map) {
    return GuestUserProductData(
      product_id: map['product_id'] != null ? map['product_id'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }
  @override
  String toString() =>
      'GuestUserProductData(product_id: $product_id, quantity: $quantity)';
}
