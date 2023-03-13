// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      json['id'] as int?,
      json['customer_id'] as int?,
      json['entry_name'] as String?,
      json['field_data'] == null
          ? null
          : AddressFieldData.fromJson(
              json['field_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'entry_name': instance.entryName,
      'field_data': instance.fieldDataEditAddress,
    };
