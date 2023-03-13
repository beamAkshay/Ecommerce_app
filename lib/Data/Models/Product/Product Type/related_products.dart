import 'package:json_annotation/json_annotation.dart';

import 'package:unicorn_store/Data/Models/Product/Product%20Type/type_images.dart';

part 'related_products.g.dart';

@JsonSerializable()
class RelatedProduct {
   final int? id;
  final String? name;
  final int? saleprice;
  final int? price;
  final List<TypeImages>? images;
  final int? quantity;

  final String? sku;
  final String? slug;
  @JsonKey(name: "route_id")
  final int? routeId;

  final String? description;
  final String? excerpt;

  @JsonKey(name: "free_shipping")
  final int? freeShipping;
  final int? shippable;
  final int? taxable;
  @JsonKey(name: "fixed_quantity")
  final int? fixedQuantity;
  @JsonKey(name: "track_stock")
  final int? trackStock;

  @JsonKey(name: "seo_title")
  final String? seoTitle;
  final String? meta;
  final int? enabled;

  final int? affordability;
  @JsonKey(name: "allow_rating")
  final int? allowRating;
  @JsonKey(name: "show_rating")
  final int? showRating;
  @JsonKey(name: "average_rating")
  final int? averageRating;

  final int? discount;

  RelatedProduct(
    this.id,
    this.name,
    this.saleprice,
    this.price,
    this.images,
    this.quantity,
    this.sku,
    this.slug,
    this.routeId,
    this.description,
    this.excerpt,
    this.freeShipping,
    this.shippable,
    this.taxable,
    this.fixedQuantity,
    this.trackStock,
    this.seoTitle,
    this.meta,
    this.enabled,
    this.affordability,
    this.allowRating,
    this.showRating,
    this.averageRating,
    this.discount,
  );

  factory RelatedProduct.fromJson(Map<String, dynamic> typesImages) =>
      _$RelatedProductFromJson(typesImages);

  Map<String, dynamic> toJson() => _$RelatedProductToJson(this);

  @override
  String toString() {
    return 'RelatedProduct(id: $id, name: $name, saleprice: $saleprice, price: $price, images: $images, quantity: $quantity, sku: $sku, slug: $slug, routeId: $routeId, description: $description, excerpt: $excerpt, freeShipping: $freeShipping, shippable: $shippable, taxable: $taxable, fixedQuantity: $fixedQuantity, trackStock: $trackStock, seoTitle: $seoTitle, meta: $meta, enabled: $enabled, affordability: $affordability, allowRating: $allowRating, showRating: $showRating, averageRating: $averageRating, discount: $discount)';
  }
}
