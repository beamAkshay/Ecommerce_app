import 'package:json_annotation/json_annotation.dart';

part 'sub_category.g.dart';

@JsonSerializable()

class Subcategory {
  final int? id;

  @JsonKey(name: "parent_id")
  final int? parentId;

  final String? name;
  final String? slug;

  @JsonKey(name: "route_id")
  final int? routeId;

  final String? excerpt;
  final String? description;
  final int? sequence;
  final String? image;

  @JsonKey(name: "seo_title")
  final String? seoTitle;
  final String? meta;
  final int? enabled;

  @JsonKey(name: "is_navigable")
  final int? isNavigable;

  @JsonKey(name: "cat_meta")
  final int? catMeta;

  @JsonKey(name: "cat_badge")
  final String? catBadge;

  List? children;

  Subcategory({
    this.id,
    this.parentId,
    this.name,
    this.slug,
    this.routeId,
    this.excerpt,
    this.description,
    this.sequence,
    this.image,
    this.seoTitle,
    this.meta,
    this.enabled,
    this.isNavigable,
    this.catMeta,
    this.catBadge,
    required this.children,
  });

  
  factory Subcategory.fromJson(Map<String, dynamic> subcategory) =>
      _$SubcategoryFromJson(subcategory);
  Map<String, dynamic> toJson() => _$SubcategoryToJson(this);


  
}
