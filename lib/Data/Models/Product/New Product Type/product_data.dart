// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/primary_product_details.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/product_attributes.dart';

class ProductData {
  final PrimaryProductDetails? primary;

  final List<ProductAttributes>? attribute;

  ProductData(this.primary, this.attribute);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'primary': primary?.toJson(),
      'attribute': attribute!.map((x) => x.toJson()).toList(),
    };
  }

  factory ProductData.fromJson(Map<String, dynamic> map) {
    return ProductData(
      map['primary'] != null
          ? PrimaryProductDetails.fromJson(
              map['primary'] as Map<String, dynamic>)
          : null,
      map['attribute'] != null
          ? List<ProductAttributes>.from(
              (map['attribute'] as List<dynamic>).map<ProductAttributes?>(
                (x) => ProductAttributes.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() => 'ProductData(primary: $primary, attribute: $attribute)';
}
