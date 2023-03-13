// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/save%20guest%20user%20address/guest_user_product_data.dart';

class SaveGuestUserProduct {
  final List<GuestUserProductData>? product_details;
  SaveGuestUserProduct({
    this.product_details,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'product_details': product_details!.map((x) => x.toJson()).toList(),
    };
  }

  factory SaveGuestUserProduct.fromJson(Map<String, dynamic> map) {
    return SaveGuestUserProduct(
      product_details: map['product_details'] != null
          ? List<GuestUserProductData>.from(
              (map['product_details'] as List<dynamic>)
                  .map<GuestUserProductData?>(
                (x) => GuestUserProductData.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() =>
      'SaveGuestUserProduct(product_details: $product_details)';
}
