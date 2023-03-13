// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistDetails _$WishlistDetailsFromJson(Map<String, dynamic> json) =>
    WishlistDetails(
      (json['data'] as List<dynamic>?)
          ?.map((e) => WishlistProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as bool?,
      json['message'] as String?,
    );

Map<String, dynamic> _$WishlistDetailsToJson(WishlistDetails instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
