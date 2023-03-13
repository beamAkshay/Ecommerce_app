// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'filter_attributes_options.dart';

class FilterAttributes {
  final String? attribute_label;
  final String? attribute_type;
  final List<FilterAttributesOptions>? attribute_options;

  FilterAttributes(
      this.attribute_label, this.attribute_type, this.attribute_options);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'attribute_label': attribute_label,
      'attribute_type': attribute_type,
      'attribute_options': attribute_options!.map((x) => x.toJson()).toList(),
    };
  }

  factory FilterAttributes.fromJson(Map<String, dynamic> map) {
    return FilterAttributes(
      map['attribute_label'] != null ? map['attribute_label'] as String : null,
      map['attribute_type'] != null ? map['attribute_type'] as String : null,
      map['attribute_options'] != null
          ? List<FilterAttributesOptions>.from(
              (map['attribute_options'] as List<dynamic>)
                  .map<FilterAttributesOptions?>(
                (x) =>
                    FilterAttributesOptions.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  @override
  String toString() =>
      'FilterAttributes(attribute_label: $attribute_label, attribute_type: $attribute_type, attribute_options: $attribute_options)';
}
