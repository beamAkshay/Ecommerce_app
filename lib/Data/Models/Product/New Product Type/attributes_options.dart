// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class AttributesOption {
  final int? id;
  final String? option_name;
  final int? sort_order;
  final String? swatch_value;
  final String? attribute_name;
  final String? swatch_type;
  AttributesOption({
    this.id,
    this.option_name,
    this.sort_order,
    this.swatch_value,
    this.attribute_name,
    this.swatch_type,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'option_name': option_name,
      'sort_order': sort_order,
      'swatch_value': swatch_value,
      'attribute_name': attribute_name,
      'swatch_type': swatch_type,
    };
  }

  factory AttributesOption.fromJson(Map<String, dynamic> map) {
    return AttributesOption(
      id: map['id'] != null ? map['id'] as int : null,
      option_name:
          map['option_name'] != null ? map['option_name'] as String : null,
      sort_order: map['sort_order'] != null ? map['sort_order'] as int : null,
      swatch_value:
          map['swatch_value'] != null ? map['swatch_value'] as String : null,
      attribute_name: map['attribute_name'] != null
          ? map['attribute_name'] as String
          : null,
      swatch_type:
          map['swatch_type'] != null ? map['swatch_type'] as String : null,
    );
  }

  @override
  String toString() {
    return 'AttributesOption(id: $id, option_name: $option_name, sort_order: $sort_order, swatch_value: $swatch_value, attribute_name: $attribute_name, swatch_type: $swatch_type)';
  }
}
