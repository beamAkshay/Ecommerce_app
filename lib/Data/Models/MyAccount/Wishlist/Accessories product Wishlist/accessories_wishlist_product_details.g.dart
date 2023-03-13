// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessories_wishlist_product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessoriesWishlistProductDetails _$AccessoriesWishlistProductDetailsFromJson(
        Map<String, dynamic> json) =>
    AccessoriesWishlistProductDetails(
      json['data'] == null
          ? null
          : AccessoriesProduct.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessoriesWishlistProductDetailsToJson(
        AccessoriesWishlistProductDetails instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
