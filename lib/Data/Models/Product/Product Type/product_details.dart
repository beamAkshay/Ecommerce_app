import 'package:json_annotation/json_annotation.dart';

import 'package:unicorn_store/Data/Models/Product/Product%20Type/related_products.dart';
import 'package:unicorn_store/Data/Models/Product/Product%20Type/type_images.dart';
import 'package:unicorn_store/Data/Models/Product/Product%20Type/types_options.dart';

part 'product_details.g.dart';

@JsonSerializable()
class ProductDetails {
  @JsonKey(name: "types_id")
  final int? typesId;

  @JsonKey(name: "types_name")
  final String? typesName;

  @JsonKey(name: "types_description")
  final String? typesDescription;

  @JsonKey(name: "types_seo_title")
  final String? typesSeoTitle;

  @JsonKey(name: "types_slug")
  final String? typesSlug;

  @JsonKey(name: "types_route_id")
  final int? typesRouteId;

  @JsonKey(name: "types_enabled")
  final int? typesEnabled;

  @JsonKey(name: "emi_options")
  final String? emiOptions;

  final int? cashback;

  @JsonKey(name: "affordability_note")
  final String? affordabilityNote;

  final String? offers;

  @JsonKey(name: "types_badge")
  final String? typesBadge;

  final int? display;

  @JsonKey(name: "buyback_options")
  final String? buybackOptions;

  // @JsonKey(name: "cashback_note")
  // final String? cashbackNote;

  @JsonKey(name: "type_options")
  final List<TypesOptions>? typeOptions;

  @JsonKey(name: "types_images")
  final List<TypeImages>? typeImages;

  @JsonKey(name: "related_products")
  final List<RelatedProduct>? relatedProduct;

  final bool? status;
  final String? msg;

  ProductDetails(
    this.typesId,
    this.typesName,
    this.typesDescription,
    this.typesSeoTitle,
    this.typesSlug,
    this.typesRouteId,
    this.typesEnabled,
    this.emiOptions,
    this.cashback,
    this.affordabilityNote,
    this.offers,
    this.typesBadge,
    this.display,
    this.buybackOptions,
    this.typeOptions,
    this.typeImages,
    this.relatedProduct,
    this.status,
    this.msg,
  );

  factory ProductDetails.fromJson(Map<String, dynamic> productDetails) =>
      _$ProductDetailsFromJson(productDetails);
  Map<String, dynamic> toJson() => _$ProductDetailsToJson(this);

  @override
  String toString() {
    return 'ProductDetails(typesId: $typesId, typesName: $typesName, typesDescription: $typesDescription, typesSeoTitle: $typesSeoTitle, typesSlug: $typesSlug, typesRouteId: $typesRouteId, typesEnabled: $typesEnabled, emiOptions: $emiOptions, cashback: $cashback, affordabilityNote: $affordabilityNote, offers: $offers, typesBadge: $typesBadge, display: $display, buybackOptions: $buybackOptions, typeOptions: $typeOptions, typeImages: $typeImages, relatedProduct: $relatedProduct, status: $status, msg: $msg)';
  }
}
