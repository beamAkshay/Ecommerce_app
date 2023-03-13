import 'package:json_annotation/json_annotation.dart';

import 'package:unicorn_store/Data/Models/MyAccount/Wishlist/wishlist_product.dart';

part 'wishlist_details.g.dart';

@JsonSerializable()
class WishlistDetails {
  final List<WishlistProduct>? data;
  final bool? status;
  final String? message;

  WishlistDetails(
    this.data,
    this.status,
    this.message,
  );

  factory WishlistDetails.fromJson(Map<String, dynamic> wishlistDetails) =>
      _$WishlistDetailsFromJson(wishlistDetails);
  Map<String, dynamic> toJson() => _$WishlistDetailsToJson(this);

  @override
  String toString() => 'WishlistDetails(data: $data, status: $status, message: $message)';
}
