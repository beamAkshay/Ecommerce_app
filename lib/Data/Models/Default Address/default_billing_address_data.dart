// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Default%20Address/default__addreses_field_data.dart';

class DefaultBillingAddress {
  final int? id;
  final int? customer_id;
  final String? entry_name;
  final DefaultAddressFieldData? field_data;
  DefaultBillingAddress({
    this.id,
    this.customer_id,
    this.entry_name,
    this.field_data,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'customer_id': customer_id,
      'entry_name': entry_name,
      'field_data': field_data?.toJson(),
    };
  }

  factory DefaultBillingAddress.fromJson(Map<String, dynamic> map) {
    return DefaultBillingAddress(
      id: map['id'] != null ? map['id'] as int : null,
      customer_id: map['customer_id'] != null ? map['customer_id'] as int : null,
      entry_name: map['entry_name'] != null ? map['entry_name'] as String : null,
      field_data: map['field_data'] != null ? DefaultAddressFieldData.fromJson(map['field_data'] as Map<String,dynamic>) : null,
    );
  }

  @override
  String toString() {
    return 'DefaultBillingAddress(id: $id, customer_id: $customer_id, entry_name: $entry_name, field_data: $field_data)';
  }
}
