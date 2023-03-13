import 'package:json_annotation/json_annotation.dart';

import 'accessories_product.dart';

part 'accessories_children.g.dart';

@JsonSerializable()
class AccessoriesChildren {
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

  

  final List<AccessoriesChildren>? children;

   final List<AccessoriesProduct>? products;

 

  factory AccessoriesChildren.fromJson(
          Map<String, dynamic> accessoriesChildren) =>
      _$AccessoriesChildrenFromJson(accessoriesChildren);

  AccessoriesChildren(this.id, this.parentId, this.name, this.slug, this.routeId, this.excerpt, this.description, this.sequence, this.image, this.seoTitle, this.meta, this.enabled, this.isNavigable, this.catMeta, this.catBadge, this.children, this.products);
  Map<String, dynamic> toJson() => _$AccessoriesChildrenToJson(this);

  

  @override
  String toString() {
    return 'AccessoriesChildren(id: $id, parentId: $parentId, name: $name, slug: $slug, routeId: $routeId, excerpt: $excerpt, description: $description, sequence: $sequence, image: $image, seoTitle: $seoTitle, meta: $meta, enabled: $enabled, isNavigable: $isNavigable, catMeta: $catMeta, catBadge: $catBadge, children: $children, products: $products)';
  }
}
