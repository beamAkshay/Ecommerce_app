// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressFieldData _$AddressFieldDataFromJson(Map<String, dynamic> json) =>
    AddressFieldData(
      json['lastname'] as String?,
      json['firstname'] as String?,
      json['email'] as String?,
      json['phone'] as int?,
      json['address1'] as String?,
      json['address2'] as String?,
      json['city'] as String?,
      json['zip'] as int?,
      json['zone'] as String?,
      json['country'] as String?,
      json['country_code'] as String?,
      json['country_id'] as int?,
      json['zone_id'] as int?,
    );

Map<String, dynamic> _$AddressFieldDataToJson(AddressFieldData instance) =>
    <String, dynamic>{
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'email': instance.email,
      'phone': instance.phone,
      'address1': instance.address1,
      'address2': instance.address2,
      'city': instance.city,
      'zip': instance.zip,
      'zone': instance.zone,
      'country': instance.country,
      'country_code': instance.countryCode,
      'country_id': instance.countryId,
      'zone_id': instance.zoneId,
    };
