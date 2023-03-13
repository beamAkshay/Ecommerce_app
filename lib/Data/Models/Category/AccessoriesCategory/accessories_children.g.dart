// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessories_children.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessoriesChildren _$AccessoriesChildrenFromJson(Map<String, dynamic> json) =>
    AccessoriesChildren(
      json['id'] as int?,
      json['parent_id'] as int?,
      json['name'] as String?,
      json['slug'] as String?,
      json['route_id'] as int?,
      json['excerpt'] as String?,
      json['description'] as String?,
      json['sequence'] as int?,
      json['image'] as String?,
      json['seo_title'] as String?,
      json['meta'] as String?,
      json['enabled'] as int?,
      json['is_navigable'] as int?,
      json['cat_meta'] as int?,
      json['cat_badge'] as String?,
      (json['children'] as List<dynamic>?)
          ?.map((e) => AccessoriesChildren.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>?)
          ?.map((e) => AccessoriesProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccessoriesChildrenToJson(
        AccessoriesChildren instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'slug': instance.slug,
      'route_id': instance.routeId,
      'excerpt': instance.excerpt,
      'description': instance.description,
      'sequence': instance.sequence,
      'image': instance.image,
      'seo_title': instance.seoTitle,
      'meta': instance.meta,
      'enabled': instance.enabled,
      'is_navigable': instance.isNavigable,
      'cat_meta': instance.catMeta,
      'cat_badge': instance.catBadge,
      'children': instance.children,
      'products': instance.products,
    };
