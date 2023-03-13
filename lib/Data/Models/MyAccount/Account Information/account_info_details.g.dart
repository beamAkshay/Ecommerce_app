// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_info_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountInfoDetails _$AccountInfoDetailsFromJson(Map<String, dynamic> json) =>
    AccountInfoDetails(
      json['data'] == null
          ? null
          : AddressDetails.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountInfoDetailsToJson(AccountInfoDetails instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
