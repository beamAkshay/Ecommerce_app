// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class CategoryInfo {
  final int? id;
  final int? parent_id;
  final String? name;
  final String? slug;
  final int? route_id;
  final String? description;
  final String? excerpt;
  final int? sequence;
  final String? image;
  final String? seo_title;
  final String? meta;
  final int? enabled;
  final int? is_navigable;
  final String? cat_badge;
  final List<CategoryInfo>? children;
  final bool? accessories;
  final bool? watch;

  CategoryInfo({
    this.id,
    this.parent_id,
    this.name,
    this.slug,
    this.route_id,
    this.description,
    this.excerpt,
    this.sequence,
    this.image,
    this.seo_title,
    this.meta,
    this.enabled,
    this.is_navigable,
    this.cat_badge,
    required this.children,
    this.accessories,
    this.watch,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'parent_id': parent_id,
      'name': name,
      'slug': slug,
      'route_id': route_id,
      'description': description,
      'excerpt': excerpt,
      'sequence': sequence,
      'image': image,
      'seo_title': seo_title,
      'meta': meta,
      'enabled': enabled,
      'is_navigable': is_navigable,
      'cat_badge': cat_badge,
      'children': children!.map((x) => x.toJson()).toList(),
      'accessories': accessories,
      'watch': watch,
    };
  }

  factory CategoryInfo.fromJson(Map<String, dynamic> map) {
    return CategoryInfo(
      id: map['id'] != null ? map['id'] as int : null,
      parent_id: map['parent_id'] != null ? map['parent_id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      route_id: map['route_id'] != null ? map['route_id'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      sequence: map['sequence'] != null ? map['sequence'] as int : null,
      // image: map['image'] != null ? map['image'] as String : null,
      image: "",
      seo_title: map['seo_title'] != null ? map['seo_title'] as String : null,
      meta: map['meta'] != null ? map['meta'] as String : null,
      enabled: map['enabled'] != null ? map['enabled'] as int : null,
      is_navigable:
          map['is_navigable'] != null ? map['is_navigable'] as int : null,
      cat_badge: map['cat_badge'] != null ? map['cat_badge'] as String : null,
      children: map['children'] != null
          ? List<CategoryInfo>.from(
              (map['children'] as List<dynamic>).map<CategoryInfo?>(
                (x) => CategoryInfo.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      accessories:
          map['accessories'] != null ? map['accessories'] as bool : null,
      watch: map['watch'] != null ? map['watch'] as bool : null,
    );
  }

  @override
  String toString() {
    return 'CategoryInfo(id: $id, parent_id: $parent_id, name: $name, slug: $slug, route_id: $route_id, description: $description, excerpt: $excerpt, sequence: $sequence, image: $image, seo_title: $seo_title, meta: $meta, enabled: $enabled, is_navigable: $is_navigable, cat_badge: $cat_badge, children: $children, accessories: $accessories, watch: $watch)';
  }
}
