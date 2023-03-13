// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryTypes _$SubcategoryTypesFromJson(Map<String, dynamic> json) =>
    SubcategoryTypes(
      json['types_id'] as int?,
      json['types_name'] as String?,
      json['type_image'] as String?,
      json['types_slug'] as String?,
      json['saleprice'] as int?,
      json['price'] as int?,
      json['discount'] as int?,
    );

Map<String, dynamic> _$SubcategoryTypesToJson(SubcategoryTypes instance) =>
    <String, dynamic>{
      'types_id': instance.types_id,
      'types_name': instance.types_name,
      'type_image': instance.type_image,
      'types_slug': instance.types_slug,
      'saleprice': instance.saleprice,
      'price': instance.price,
      'discount': instance.discount,
    };
