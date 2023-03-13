

import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/Category/AccessoriesCategory/accessories_product.dart';
part 'accessories_wishlist_product_details.g.dart';

@JsonSerializable()
class AccessoriesWishlistProductDetails
{

  final AccessoriesProduct? data;

  AccessoriesWishlistProductDetails(this.data);

  factory AccessoriesWishlistProductDetails.fromJson(Map<String, dynamic> accessoriesWishlistProductDetails) =>
      _$AccessoriesWishlistProductDetailsFromJson(accessoriesWishlistProductDetails);

  Map<String, dynamic> toJson() => _$AccessoriesWishlistProductDetailsToJson(this);

  @override
  String toString() => 'AccessoriesWishlistProductDetails(AccessoriesProduct: $data)';


}