import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/Category/AccessoriesCategory/accessories_children.dart';
part 'accessories_data.g.dart';

@JsonSerializable()
class AccessoriesData {
  final int? id;

  @JsonKey(name: "parent_id")
  final int? parentId;

  final String? name;
  final String? slug;

  @JsonKey(name: "route_id")
  final int? routeId;

  final String? description;
  final String? excerpt;
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

  List<AccessoriesChildren>? children;

  AccessoriesData({
    this.id,
    this.parentId,
    this.name,
    this.slug,
    this.routeId,
    this.description,
    this.excerpt,
    this.sequence,
    this.image,
    this.seoTitle,
    this.meta,
    this.enabled,
    this.isNavigable,
    this.catMeta,
    this.catBadge,
    this.children,
  });

  factory AccessoriesData.fromJson(Map<String, dynamic> accessoriesData) =>
      _$AccessoriesDataFromJson(accessoriesData);

  Map<String, dynamic> toJson() => _$AccessoriesDataToJson(this);


  @override
  String toString() {
    return 'AccessoriesData(id: $id, parentId: $parentId, name: $name, slug: $slug, routeId: $routeId, description: $description, excerpt: $excerpt, sequence: $sequence, image: $image, seoTitle: $seoTitle, meta: $meta, enabled: $enabled, isNavigable: $isNavigable, catMeta: $catMeta, catBadge: $catBadge, children: $children)';
  }
}
