import 'package:json_annotation/json_annotation.dart';

import 'package:unicorn_store/Data/Models/Product/Product%20Type/type_images.dart';

part 'accessories_product.g.dart';

@JsonSerializable()
class AccessoriesProduct {
  final int? id;

  final String? sku;
  final String? name;
  final String? slug;
  @JsonKey(name: "route_id")
  final int? routeId;

  final String? description;
  final String? excerpt;
  final int? price;
  final int? saleprice;

  @JsonKey(name: "free_shipping")
  final int? freeShipping;
  final int? shippable;
  final int? taxable;
  @JsonKey(name: "fixed_quantity")
  final int? fixedQuantity;
  @JsonKey(name: "track_stock")
  final int? trackStock;
  final int? quantity;

  @JsonKey(name: "seo_title")
  final String? seoTitle;
  final String? meta;
  final int? enabled;
  // final int? tag;

  // @JsonKey(name: "option_pincodes")
  // final String? optionPincodes;
  // @JsonKey(name: "product_code")
  // final String? productCode;
//   @JsonKey(name: "hsn_code")
//   final String? hsnCode;

  final int? affordability;
  @JsonKey(name: "allow_rating")
  final int? allowRating;
  @JsonKey(name: "show_rating")
  final int? showRating;
  @JsonKey(name: "average_rating")
  final int? averageRating;

  final int? discount;
  final bool? wishlist;

  List<TypeImages>? images;

  AccessoriesProduct({
    this.id,
    this.sku,
    this.name,
    this.slug,
    this.routeId,
    this.description,
    this.excerpt,
    this.price,
    this.saleprice,
    this.freeShipping,
    this.shippable,
    this.taxable,
    this.fixedQuantity,
    this.trackStock,
    this.quantity,
    this.seoTitle,
    this.meta,
    this.enabled,
    this.affordability,
    this.allowRating,
    this.showRating,
    this.averageRating,
    this.discount,
    this.images,
    this.wishlist,
  });

  factory AccessoriesProduct.fromJson(
          Map<String, dynamic> accessoriesProduct) =>
      _$AccessoriesProductFromJson(accessoriesProduct);

  Map<String, dynamic> toJson() => _$AccessoriesProductToJson(this);

  @override
  String toString() {
    return 'AccessoriesProduct(id: $id,wishlist: $wishlist, sku: $sku, name: $name, slug: $slug, routeId: $routeId, description: $description, excerpt: $excerpt, price: $price, saleprice: $saleprice, freeShipping: $freeShipping, shippable: $shippable, taxable: $taxable, fixedQuantity: $fixedQuantity, trackStock: $trackStock, quantity: $quantity, seoTitle: $seoTitle, meta: $meta, enabled: $enabled, affordability: $affordability, allowRating: $allowRating, showRating: $showRating, averageRating: $averageRating, discount: $discount, images: $images, )';
  }
}
