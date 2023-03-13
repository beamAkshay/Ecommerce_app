// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/attributes_options.dart';

class ProductAttributes {
  final String? attribute_label;
  final List<AttributesOption>? attribute_options;
  final String? swatch_type;

  ProductAttributes(
      this.attribute_label, this.attribute_options, this.swatch_type);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'attribute_label': attribute_label,
      'attribute_options': attribute_options!.map((x) => x.toJson()).toList(),
      'swatch_type': swatch_type,
    };
  }

  factory ProductAttributes.fromJson(Map<String, dynamic> map) {
    return ProductAttributes(
      map['attribute_label'] != null ? map['attribute_label'] as String : null,
      map['attribute_options'] != null
          ? List<AttributesOption>.from(
              (map['attribute_options'] as List<dynamic>)
                  .map<AttributesOption?>(
                (x) => AttributesOption.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      map['swatch_type'] != null ? map['swatch_type'] as String : null,
    );
  }

  @override
  String toString() =>
      'ProductAttributes(attribute_label: $attribute_label, attribute_options: $attribute_options, swatch_type: $swatch_type)';
}
