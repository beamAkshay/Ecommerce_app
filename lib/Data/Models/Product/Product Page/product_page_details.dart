import 'package:json_annotation/json_annotation.dart';
import 'images.dart';
part 'product_page_details.g.dart';

@JsonSerializable()
class ProductPageDetail
{  

   final int? id;
  final String? sku;
  final String? name;
  final String? slug;
  @JsonKey(name: "route_id")
  final int? routeId;
  final String? description;
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
  @JsonKey(name: "option_pincodes")
  final String? optionPincodes;
  @JsonKey(name: "product_code")
  final String? productCode;
  @JsonKey(name: "hsn_code")
  final String? hsnCode;
  final int? affordability;
  @JsonKey(name: "allow_rating")
  final int? allowRating;
  @JsonKey(name: "show_rating")
  final int? showRating;
  @JsonKey(name: "average_rating")
  final int? averageRating;
  @JsonKey(name: "types_id")
  final int? typesId;
  @JsonKey(name: "types_name")
  final String? typesName;
  final int? cashback;
  @JsonKey(name: "affordability_note")
  final String? affordabilityNote;
  final String? offers;
  @JsonKey(name: "types_badge")
  final String? typesBadge;
  final int? display;
  @JsonKey(name: "buyback_options")
  final String? buybackOptions;
  @JsonKey(name: "cashback_note")
  final String? cashbackNote;
  @JsonKey(name: "types_route_id")
  final int? typesRouteId;
  @JsonKey(name: "types_enabled")
  final int? typesEnabled;
  @JsonKey(name: "emi_options")
  final String? emiOptions;

  final int? discount;

  List<Images> images;

  final bool? wishlist;

   ProductPageDetail(
      this.id,
      this.sku,
      this.name,
      this.slug,
      this.routeId,
      this.description,
  
      this.price,
      this.saleprice,
      this.images,
      this.freeShipping,
      this.shippable,
      this.taxable,
      this.fixedQuantity,
      this.trackStock,
      this.quantity,
      this.seoTitle,
      this.meta,
      this.enabled,
   
      this.optionPincodes,
      this.productCode,
      this.hsnCode,
      this.affordability,
      this.allowRating,
      this.showRating,
      this.averageRating,
      this.typesId,
      this.typesName,
      this.cashback,
      this.affordabilityNote,
      this.offers,
      this.typesBadge,
      this.display,
      this.buybackOptions,
      this.cashbackNote,
      this.typesRouteId,
      this.typesEnabled,
      this.emiOptions,
      this.discount,
      this.wishlist);


  factory ProductPageDetail.fromJson(Map<String, dynamic> productPageDetails) =>
      _$ProductPageDetailFromJson(productPageDetails);
  Map<String, dynamic> toJson() => _$ProductPageDetailToJson(this);

  
 @override
  String toString() {
    return 'ProductPageDetail(id: $id, wishlist:$wishlist,sku: $sku, name: $name, slug: $slug, routeId: $routeId, description: $description,  price: $price, saleprice: $saleprice, freeShipping: $freeShipping, shippable: $shippable, taxable: $taxable, fixedQuantity: $fixedQuantity, trackStock: $trackStock, quantity: $quantity, seoTitle: $seoTitle, meta: $meta, enabled: $enabled, optionPincodes: $optionPincodes, productCode: $productCode, hsnCode: $hsnCode, affordability: $affordability, allowRating: $allowRating, showRating: $showRating, averageRating: $averageRating, typesId: $typesId, typesName: $typesName, cashback: $cashback, affordabilityNote: $affordabilityNote, offers: $offers, typesBadge: $typesBadge, display: $display, buybackOptions: $buybackOptions, cashbackNote: $cashbackNote, typesRouteId: $typesRouteId, typesEnabled: $typesEnabled, emiOptions: $emiOptions, images: $images,)';
  }

}