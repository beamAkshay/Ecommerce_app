// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_address_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditAddressList _$EditAddressListFromJson(Map<String, dynamic> json) =>
    EditAddressList(
      json['data'] == null
          ? null
          : AddressData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditAddressListToJson(EditAddressList instance) =>
    <String, dynamic>{
      'data': instance.addressData,
    };
