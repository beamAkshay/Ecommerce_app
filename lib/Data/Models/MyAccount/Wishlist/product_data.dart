import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Wishlist/images_list.dart';
part 'product_data.g.dart';

@JsonSerializable()
class ProductData {
  final int? id;
  final String? name;
  final String? slug;

  @JsonKey(name: "route_id")
  final int? routeId;

  // @JsonKey(name: "seo_title")
  // final String? seoTitle;
  // final int? enabled;
  final int? quantity;
  final List<ImageList> images;

  ProductData(
    this.id,
    this.name,
    this.slug,
    this.routeId,
    // this.seoTitle,
    // this.enabled,
    this.quantity,
    this.images,
  );

  factory ProductData.fromJson(Map<String, dynamic> productData) =>
      _$ProductDataFromJson(productData);
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);

  @override
  String toString() {
    return 'ProductData(id: $id, name: $name, slug: $slug, routeId: $routeId, images: $images)';
  }
}
