// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryData _$SubcategoryDataFromJson(Map<String, dynamic> json) =>
    SubcategoryData(
      id: json['id'] as int?,
      parentId: json['parent_id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      routeId: json['route_id'] as int?,
      description: json['description'] as String?,
      excerpt: json['excerpt'] as String?,
      sequence: json['sequence'] as int?,
      image: json['image'] as String?,
      seoTitle: json['seo_title'] as String?,
      meta: json['meta'] as String?,
      enabled: json['enabled'] as int?,
      isNavigable: json['is_navigable'] as int?,
      catMeta: json['cat_meta'] as int?,
      catBadge: json['cat_badge'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => Subcategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubcategoryDataToJson(SubcategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'slug': instance.slug,
      'route_id': instance.routeId,
      'description': instance.description,
      'excerpt': instance.excerpt,
      'sequence': instance.sequence,
      'image': instance.image,
      'seo_title': instance.seoTitle,
      'meta': instance.meta,
      'enabled': instance.enabled,
      'is_navigable': instance.isNavigable,
      'cat_meta': instance.catMeta,
      'cat_badge': instance.catBadge,
      'children': instance.children,
    };
