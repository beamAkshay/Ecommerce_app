// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['id'] as int?,
      json['customer_id'] as int?,
      json['entry_name'] as String?,
      json['field_data'] == null
          ? null
          : AddressFieldData.fromJson(
              json['field_data'] as Map<String, dynamic>),
      json['default_billing_address'] as bool?,
      json['default_shipping_address'] as bool?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'entry_name': instance.entryName,
      'field_data': instance.addressFieldData,
      'default_billing_address': instance.defaultBillingAddress,
      'default_shipping_address': instance.defaultsShippingAddress,
    };
