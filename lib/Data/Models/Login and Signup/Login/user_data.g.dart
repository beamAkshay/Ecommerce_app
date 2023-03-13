// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['id'] as String?,
      json['firstname'] as String?,
      json['lastname'] as String?,
      json['email'] as String?,
      json['token'] as String?,
      json['email_subscribe'] as String?,
      json['phone'] as String?,
      json['company'] as String?,
      json['default_billing_address'] as String?,
      json['default_shipping_address'] as String?,
      json['ship_to_bill_address'] as String?,
      json['gst'] as String?,
      json['gender'] as String?,
      json['Responce'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'token': instance.token,
      'email_subscribe': instance.emailSubscribe,
      'phone': instance.phone,
      'company': instance.company,
      'default_billing_address': instance.defaultBillingAddress,
      'default_shipping_address': instance.defaultShippingAddress,
      'ship_to_bill_address': instance.shipToBillAddress,
      'gst': instance.gst,
      'gender': instance.gender,
      'Responce': instance.responce,
    };
