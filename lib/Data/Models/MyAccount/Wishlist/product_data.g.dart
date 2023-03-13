// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      json['id'] as int?,
      json['name'] as String?,
      json['slug'] as String?,
      json['route_id'] as int?,
      json['quantity'] as int?,
      (json['images'] as List<dynamic>)
          .map((e) => ImageList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'route_id': instance.routeId,
      'quantity': instance.quantity,
      'images': instance.images,
    };
