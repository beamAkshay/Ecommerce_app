// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistProduct _$WishlistProductFromJson(Map<String, dynamic> json) =>
    WishlistProduct(
      json['id'] as int?,
      json['product_id'] as int?,
      json['customer_id'] as int?,
      json['created_at'] as String?,
      json['slug'] as String?,
      json['product_details'] == null
          ? null
          : ProductData.fromJson(
              json['product_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WishlistProductToJson(WishlistProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'customer_id': instance.customerId,
      'created_at': instance.createdAt,
      'slug': instance.slug,
      'product_details': instance.productDetails,
    };
