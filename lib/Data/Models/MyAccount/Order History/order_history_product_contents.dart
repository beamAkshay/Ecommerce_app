// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Product/New%20Product/type_image.dart';

class OrderHistoryProductContents {
  final int? id;
  final String? sku;
  final String? name;
  final String? slug;
  final String? description;
  final String? excerpt;
  final int? price;
  final int? saleprice;
  final int? quantity;
  //   final String? related_products": null,
  final List<TypeImage>? images;

  final int? enabled;
  final int? route_id;
  final int? fixed_quantity;
  OrderHistoryProductContents({
    this.id,
    this.sku,
    this.name,
    this.slug,
    this.description,
    this.excerpt,
    this.price,
    this.saleprice,
    this.quantity,
    this.images,
    this.enabled,
    this.route_id,
    this.fixed_quantity,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'sku': sku,
      'name': name,
      'slug': slug,
      'description': description,
      'excerpt': excerpt,
      'price': price,
      'saleprice': saleprice,
      'quantity': quantity,
      'images': images!.map((x) => x.toJson()).toList(),
      'enabled': enabled,
      'route_id': route_id,
      'fixed_quantity': fixed_quantity,
    };
  }

  factory OrderHistoryProductContents.fromJson(Map<String, dynamic> map) {
    return OrderHistoryProductContents(
      id: map['id'] != null ? map['id'] as int : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      saleprice: map['saleprice'] != null ? map['saleprice'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      images: map['images'] != null ? List<TypeImage>.from((map['images'] as List<dynamic>).map<TypeImage?>((x) => TypeImage.fromJson(x as Map<String,dynamic>),),) : [],
      enabled: map['enabled'] != null ? map['enabled'] as int : null,
      route_id: map['route_id'] != null ? map['route_id'] as int : null,
      fixed_quantity: map['fixed_quantity'] != null ? map['fixed_quantity'] as int : null,
    );
  }

  @override
  String toString() {
    return 'OrderHistoryProductContents(id: $id, sku: $sku, name: $name, slug: $slug, description: $description, excerpt: $excerpt, price: $price, saleprice: $saleprice, quantity: $quantity, images: $images, enabled: $enabled, route_id: $route_id, fixed_quantity: $fixed_quantity)';
  }
}
