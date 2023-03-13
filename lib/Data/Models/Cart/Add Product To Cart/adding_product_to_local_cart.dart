// // ignore_for_file: public_member_api_docs, sort_constructors_first
// // ignore_for_file: non_constant_identifier_names

// import 'package:hive/hive.dart';
// import 'package:unicorn_store/Data/Models/Product/New%20Product/type_image.dart';
// part 'adding_product_to_local_cart.g.dart';

// @HiveType(typeId: 0)
// class AddingProductToLocalCart extends HiveObject {
//   @HiveField(0)
//   final int? item_quantity;

//   @HiveField(1)
//   final int? id;

//   @HiveField(2)
//   final String? sku;

//   @HiveField(3)
//   final String? name;

//   @HiveField(4)
//   final String? slug;

//   @HiveField(5)
//   final String? description;

//   @HiveField(6)
//   final String? excerpt;

//   @HiveField(7)
//   final double? price;

//   @HiveField(8)
//   final double? saleprice;

//   @HiveField(9)
//   final int? quantity;

//   @HiveField(10)
//   final String? related_products;

//   @HiveField(11)
//   final List<TypeImage>? images;

//   @HiveField(12)
//   final int? enabled;

//   @HiveField(13)
//   final int? route_id;

//   @HiveField(14)
//   final int? fixed_quantity;

//   AddingProductToLocalCart({
//       this.item_quantity,
//       this.id,
//       this.sku,
//       this.name,
//       this.slug,
//       this.description,
//       this.excerpt,
//       this.price,
//       this.saleprice,
//       this.quantity,
//       this.related_products,
//       this.images,
//       this.enabled,
//       this.route_id,
//       this.fixed_quantity});

//   @override
//   String toString() {
//     return 'AddingProductToLocalCart(item_quantity: $item_quantity, id: $id, sku: $sku, name: $name, slug: $slug, description: $description, excerpt: $excerpt, price: $price, saleprice: $saleprice, quantity: $quantity, related_products: $related_products, images: $images, enabled: $enabled, route_id: $route_id, fixed_quantity: $fixed_quantity)';
//   }
// }
