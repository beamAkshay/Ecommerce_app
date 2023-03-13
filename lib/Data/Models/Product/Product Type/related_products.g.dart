// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedProduct _$RelatedProductFromJson(Map<String, dynamic> json) =>
    RelatedProduct(
      json['id'] as int?,
      json['name'] as String?,
      json['saleprice'] as int?,
      json['price'] as int?,
      (json['images'] as List<dynamic>?)
          ?.map((e) => TypeImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['quantity'] as int?,
      json['sku'] as String?,
      json['slug'] as String?,
      json['route_id'] as int?,
      json['description'] as String?,
      json['excerpt'] as String?,
      json['free_shipping'] as int?,
      json['shippable'] as int?,
      json['taxable'] as int?,
      json['fixed_quantity'] as int?,
      json['track_stock'] as int?,
      json['seo_title'] as String?,
      json['meta'] as String?,
      json['enabled'] as int?,
      json['affordability'] as int?,
      json['allow_rating'] as int?,
      json['show_rating'] as int?,
      json['average_rating'] as int?,
      json['discount'] as int?,
    );

Map<String, dynamic> _$RelatedProductToJson(RelatedProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'saleprice': instance.saleprice,
      'price': instance.price,
      'images': instance.images,
      'quantity': instance.quantity,
      'sku': instance.sku,
      'slug': instance.slug,
      'route_id': instance.routeId,
      'description': instance.description,
      'excerpt': instance.excerpt,
      'free_shipping': instance.freeShipping,
      'shippable': instance.shippable,
      'taxable': instance.taxable,
      'fixed_quantity': instance.fixedQuantity,
      'track_stock': instance.trackStock,
      'seo_title': instance.seoTitle,
      'meta': instance.meta,
      'enabled': instance.enabled,
      'affordability': instance.affordability,
      'allow_rating': instance.allowRating,
      'show_rating': instance.showRating,
      'average_rating': instance.averageRating,
      'discount': instance.discount,
    };
