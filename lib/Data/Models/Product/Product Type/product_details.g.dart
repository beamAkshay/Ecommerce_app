// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetails _$ProductDetailsFromJson(Map<String, dynamic> json) =>
    ProductDetails(
      json['types_id'] as int?,
      json['types_name'] as String?,
      json['types_description'] as String?,
      json['types_seo_title'] as String?,
      json['types_slug'] as String?,
      json['types_route_id'] as int?,
      json['types_enabled'] as int?,
      json['emi_options'] as String?,
      json['cashback'] as int?,
      json['affordability_note'] as String?,
      json['offers'] as String?,
      json['types_badge'] as String?,
      json['display'] as int?,
      json['buyback_options'] as String?,
      (json['type_options'] as List<dynamic>?)
          ?.map((e) => TypesOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['types_images'] as List<dynamic>?)
          ?.map((e) => TypeImages.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['related_products'] as List<dynamic>?)
          ?.map((e) => RelatedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as bool?,
      json['msg'] as String?,
    );

Map<String, dynamic> _$ProductDetailsToJson(ProductDetails instance) =>
    <String, dynamic>{
      'types_id': instance.typesId,
      'types_name': instance.typesName,
      'types_description': instance.typesDescription,
      'types_seo_title': instance.typesSeoTitle,
      'types_slug': instance.typesSlug,
      'types_route_id': instance.typesRouteId,
      'types_enabled': instance.typesEnabled,
      'emi_options': instance.emiOptions,
      'cashback': instance.cashback,
      'affordability_note': instance.affordabilityNote,
      'offers': instance.offers,
      'types_badge': instance.typesBadge,
      'display': instance.display,
      'buyback_options': instance.buybackOptions,
      'type_options': instance.typeOptions,
      'types_images': instance.typeImages,
      'related_products': instance.relatedProduct,
      'status': instance.status,
      'msg': instance.msg,
    };
