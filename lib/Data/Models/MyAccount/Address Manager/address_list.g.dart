// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressList _$AddressListFromJson(Map<String, dynamic> json) => AddressList(
      (json['data'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as bool?,
    );

Map<String, dynamic> _$AddressListToJson(AddressList instance) =>
    <String, dynamic>{
      'data': instance.address,
      'status': instance.status,
    };
