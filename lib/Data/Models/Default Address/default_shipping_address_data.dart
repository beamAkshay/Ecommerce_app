// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:unicorn_store/Data/Models/Default%20Address/default__addreses_field_data.dart';

class DefaultShippingAddress {
  final int? id;
  final int? customer_id;
  final String? entry_name;
  final DefaultAddressFieldData? field_data;

  DefaultShippingAddress(
      this.id, this.customer_id, this.entry_name, this.field_data);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'customer_id': customer_id,
      'entry_name': entry_name,
      'field_data': field_data?.toJson(),
    };
  }

  factory DefaultShippingAddress.fromJson(Map<String, dynamic> map) {
    return DefaultShippingAddress(
      map['id'] != null ? map['id'] as int : null,
      map['customer_id'] != null ? map['customer_id'] as int : null,
      map['entry_name'] != null ? map['entry_name'] as String : null,
      map['field_data'] != null
          ? DefaultAddressFieldData.fromJson(
              map['field_data'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() {
    return 'DefaultShippingAddress(id: $id, customer_id: $customer_id, entry_name: $entry_name, field_data: $field_data)';
  }
}
