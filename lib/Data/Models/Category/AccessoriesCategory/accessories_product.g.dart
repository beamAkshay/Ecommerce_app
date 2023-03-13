// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessories_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessoriesProduct _$AccessoriesProductFromJson(Map<String, dynamic> json) =>
    AccessoriesProduct(
      id: json['id'] as int?,
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      routeId: json['route_id'] as int?,
      description: json['description'] as String?,
      excerpt: json['excerpt'] as String?,
      price: json['price'] as int?,
      saleprice: json['saleprice'] as int?,
      freeShipping: json['free_shipping'] as int?,
      shippable: json['shippable'] as int?,
      taxable: json['taxable'] as int?,
      fixedQuantity: json['fixed_quantity'] as int?,
      trackStock: json['track_stock'] as int?,
      quantity: json['quantity'] as int?,
      seoTitle: json['seo_title'] as String?,
      meta: json['meta'] as String?,
      enabled: json['enabled'] as int?,
      affordability: json['affordability'] as int?,
      allowRating: json['allow_rating'] as int?,
      showRating: json['show_rating'] as int?,
      averageRating: json['average_rating'] as int?,
      discount: json['discount'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => TypeImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      wishlist: json['wishlist'] as bool?,
    );

Map<String, dynamic> _$AccessoriesProductToJson(AccessoriesProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'slug': instance.slug,
      'route_id': instance.routeId,
      'description': instance.description,
      'excerpt': instance.excerpt,
      'price': instance.price,
      'saleprice': instance.saleprice,
      'free_shipping': instance.freeShipping,
      'shippable': instance.shippable,
      'taxable': instance.taxable,
      'fixed_quantity': instance.fixedQuantity,
      'track_stock': instance.trackStock,
      'quantity': instance.quantity,
      'seo_title': instance.seoTitle,
      'meta': instance.meta,
      'enabled': instance.enabled,
      'affordability': instance.affordability,
      'allow_rating': instance.allowRating,
      'show_rating': instance.showRating,
      'average_rating': instance.averageRating,
      'discount': instance.discount,
      'wishlist': instance.wishlist,
      'images': instance.images,
    };
