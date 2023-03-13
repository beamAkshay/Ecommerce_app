// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      json['status'] as bool?,
      json['message'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'data': instance.userData,
      'status': instance.status,
      'message': instance.message,
    };
