// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';

import '../../Product/New Product/type_image.dart';

part 'cart_product_data.g.dart';

@HiveType(typeId: 0)
class CartProductData extends HiveObject{
  final int? cart_item_id;

  @HiveField(0)
  int? item_quantity;

  @HiveField(1)
  final int? id;

  @HiveField(2)
  final String? sku;

  @HiveField(3)
  final String? name;

  @HiveField(4)
  final String? slug;

  @HiveField(5)
  final String? description;

  @HiveField(6)
  final String? excerpt;

  @HiveField(7)
  final double? price;

  @HiveField(8)
  final double? saleprice;

  @HiveField(9)
  final int? quantity;

  @HiveField(10)
  final String? related_products;

  @HiveField(11)
  final List<TypeImage>? images;

  @HiveField(12)
  final int? enabled;

  @HiveField(13)
  final int? route_id;
  

  @HiveField(14)
  final int? fixed_quantity;

  CartProductData({
    this.cart_item_id,
    this.item_quantity,
    this.id,
    this.sku,
    this.name,
    this.slug,
    this.description,
    this.excerpt,
    this.price,
    this.saleprice,
    this.quantity,
    this.related_products,
    this.images,
    this.enabled,
    this.route_id,
    this.fixed_quantity,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cart_item_id': cart_item_id,
      'item_quantity': item_quantity,
      'id': id,
      'sku': sku,
      'name': name,
      'slug': slug,
      'description': description,
      'excerpt': excerpt,
      'price': price,
      'saleprice': saleprice,
      'quantity': quantity,
      'related_products': related_products,
      'images': images!.map((x) => x.toJson()).toList(),
      'enabled': enabled,
      'route_id': route_id,
      'fixed_quantity': fixed_quantity,
    };
  }

  factory CartProductData.fromJson(Map<String, dynamic> map) {
    return CartProductData(
      cart_item_id: map['cart_item_id'] != null ? map['cart_item_id'] as int : null,
      item_quantity: map['item_quantity'] != null ? map['item_quantity'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      saleprice: map['saleprice'] != null ? map['saleprice'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      related_products: map['related_products'] != null ? map['related_products'] as String : null,
      images: map['images'] != null ? List<TypeImage>.from((map['images'] as List<dynamic>).map<TypeImage?>((x) => TypeImage.fromJson(x as Map<String,dynamic>),),) : [],
      enabled: map['enabled'] != null ? map['enabled'] as int : null,
      route_id: map['route_id'] != null ? map['route_id'] as int : null,
      fixed_quantity: map['fixed_quantity'] != null ? map['fixed_quantity'] as int : null,
    );
  }

  @override
  String toString() {
    return 'CartProductData(cart_item_id: $cart_item_id, item_quantity: $item_quantity, id: $id, sku: $sku, name: $name, slug: $slug, description: $description, excerpt: $excerpt, price: $price, saleprice: $saleprice, quantity: $quantity, related_products: $related_products, images: $images, enabled: $enabled, route_id: $route_id, fixed_quantity: $fixed_quantity)';
  }
}
