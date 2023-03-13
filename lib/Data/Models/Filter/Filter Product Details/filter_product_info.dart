// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20Details/filter_product_selected_attributes.dart';

import '../../Product/New Product Type/product_attributes.dart';
import '../../Product/New Product/single_product.dart';

class FilterProductInfo {
  final bool? status;
  final SingleProduct? product;
  final List<FilterProductSelectedAttributes>? selected_attribute;
  final List<ProductAttributes>? attributes;

  FilterProductInfo(
      this.status, this.product, this.selected_attribute, this.attributes);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'product': product?.toJson(),
      'selected_attribute': selected_attribute!.map((x) => x.toJson()).toList(),
      'attributes': attributes!.map((x) => x.toJson()).toList(),
    };
  }

  factory FilterProductInfo.fromJson(Map<String, dynamic> map) {
    return FilterProductInfo(
      map['status'] != null ? map['status'] as bool : null,
      map['product'] != null
          ? SingleProduct.fromJson(map['product'] as Map<String, dynamic>)
          : null,
      map['selected_attribute'] != null
          ? List<FilterProductSelectedAttributes>.from(
              (map['selected_attribute'] as List<dynamic>)
                  .map<FilterProductSelectedAttributes?>(
                (x) => FilterProductSelectedAttributes.fromJson(
                    x as Map<String, dynamic>),
              ),
            )
          : null,
      map['attributes'] != null
          ? List<ProductAttributes>.from(
              (map['attributes'] as List<dynamic>).map<ProductAttributes?>(
                (x) => ProductAttributes.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() {
    return 'FilterProductInfo(status: $status, product: $product, selected_attribute: $selected_attribute, attributes: $attributes)';
  }
}
