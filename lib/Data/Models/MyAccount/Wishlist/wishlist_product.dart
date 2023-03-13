import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Wishlist/product_data.dart';
part 'wishlist_product.g.dart';

@JsonSerializable()
class WishlistProduct {
  final int? id;

  @JsonKey(name: "product_id")
  final int? productId;
  @JsonKey(name: "customer_id")
  final int? customerId;
  @JsonKey(name: "created_at")
  final String? createdAt;
  final String? slug;

  @JsonKey(name: "product_details")
  final ProductData? productDetails;

  WishlistProduct(
    this.id,
    this.productId,
    this.customerId,
    this.createdAt,
    this.slug,
    this.productDetails,
  );

  factory WishlistProduct.fromJson(Map<String, dynamic> wishlistProduct) =>
      _$WishlistProductFromJson(wishlistProduct);
  Map<String, dynamic> toJson() => _$WishlistProductToJson(this);

  @override
  String toString() {
    return 'WishlistProduct(id: $id, productId: $productId, customerId: $customerId, createdAt: $createdAt, slug: $slug, productDetails: $productDetails)';
  }
}
