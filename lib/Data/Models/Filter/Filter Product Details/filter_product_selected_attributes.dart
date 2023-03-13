// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class FilterProductSelectedAttributes {
  final String? admin_name;
  final int? integer_value;

  FilterProductSelectedAttributes(this.admin_name, this.integer_value);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'admin_name': admin_name,
      'integer_value': integer_value,
    };
  }

  factory FilterProductSelectedAttributes.fromJson(Map<String, dynamic> map) {
    return FilterProductSelectedAttributes(
      map['admin_name'] != null ? map['admin_name'] as String : null,
      map['integer_value'] != null ? map['integer_value'] as int : null,
    );
  }

  @override
  String toString() => 'FilterProductSelectedAttributes(admin_name: $admin_name, integer_value: $integer_value)';
}
