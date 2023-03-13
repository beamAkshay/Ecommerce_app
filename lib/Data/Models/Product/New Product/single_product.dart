// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Product/New%20Product/type_image.dart';

class SingleProduct {
  final int? id;
  final String? sku;
  final String? name;
  final String? slug;
  final int? route_id;
  final String? description;
  final String? excerpt;
  final int? price;
  final int? saleprice;
  final int? free_shipping;
  final int? shippable;
  final int? taxable;
  final int? fixed_quantity;
  final dynamic dimension;
  final int? track_stock;
  final int? quantity;
  final String? related_products;
  final List<TypeImage>? images;
  final String? seo_title;
  final String? meta;
  final int? enabled;
  final String? tag;
  final String? option_pincodes;
  final String? product_code;
  final String? hsn_code;
  final int? affordability;
  final int? allow_rating;
  final int? show_rating;
  final int? average_rating;
  final int? effective_price;
  final int? parent_id;
  final bool? wishlist;

  SingleProduct({
    this.id,
    this.sku,
    this.name,
    this.slug,
    this.route_id,
    this.description,
    this.excerpt,
    this.price,
    this.saleprice,
    this.free_shipping,
    this.shippable,
    this.taxable,
    this.fixed_quantity,
    required this.dimension,
    this.track_stock,
    this.quantity,
    this.related_products,
    this.images,
    this.seo_title,
    this.meta,
    this.enabled,
    this.tag,
    this.option_pincodes,
    this.product_code,
    this.hsn_code,
    this.affordability,
    this.allow_rating,
    this.show_rating,
    this.average_rating,
    this.effective_price,
    this.parent_id,
    this.wishlist,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'sku': sku,
      'name': name,
      'slug': slug,
      'route_id': route_id,
      'description': description,
      'excerpt': excerpt,
      'price': price,
      'saleprice': saleprice,
      'free_shipping': free_shipping,
      'shippable': shippable,
      'taxable': taxable,
      'fixed_quantity': fixed_quantity,
      'dimension': dimension,
      'track_stock': track_stock,
      'quantity': quantity,
      'related_products': related_products,
      'images': images!.map((x) => x.toJson()).toList(),
      'seo_title': seo_title,
      'meta': meta,
      'enabled': enabled,
      'tag': tag,
      'option_pincodes': option_pincodes,
      'product_code': product_code,
      'hsn_code': hsn_code,
      'affordability': affordability,
      'allow_rating': allow_rating,
      'show_rating': show_rating,
      'average_rating': average_rating,
      'effective_price': effective_price,
      'parent_id': parent_id,
      'wishlist': wishlist,
    };
  }

  factory SingleProduct.fromJson(Map<String, dynamic> map) {
    return SingleProduct(
      id: map['id'] != null ? map['id'] as int : null,
      sku: map['sku'] != null ? map['sku'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      route_id: map['route_id'] != null ? map['route_id'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      excerpt: map['excerpt'] != null ? map['excerpt'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
      saleprice: map['saleprice'] != null ? map['saleprice'] as int : null,
      free_shipping:
          map['free_shipping'] != null ? map['free_shipping'] as int : null,
      shippable: map['shippable'] != null ? map['shippable'] as int : null,
      taxable: map['taxable'] != null ? map['taxable'] as int : null,
      fixed_quantity:
          map['fixed_quantity'] != null ? map['fixed_quantity'] as int : null,
      dimension: map['dimension'] as dynamic,
      track_stock:
          map['track_stock'] != null ? map['track_stock'] as int : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      related_products: map['related_products'] != null
          ? map['related_products'] as String
          : null,
      images: map['images'] != null
          ? List<TypeImage>.from(
              (map['images'] as List<dynamic>).map<TypeImage?>(
                (x) => TypeImage.fromJson(x as Map<String, dynamic>),
              ),
            )
          : [],
      seo_title: map['seo_title'] != null ? map['seo_title'] as String : null,
      meta: map['meta'] != null ? map['meta'] as String : null,
      enabled: map['enabled'] != null ? map['enabled'] as int : null,
      tag: map['tag'] != null ? map['tag'] as String : null,
      option_pincodes: map['option_pincodes'] != null
          ? map['option_pincodes'] as String
          : null,
      product_code:
          map['product_code'] != null ? map['product_code'] as String : null,
      hsn_code: map['hsn_code'] != null ? map['hsn_code'] as String : null,
      affordability:
          map['affordability'] != null ? map['affordability'] as int : null,
      allow_rating:
          map['allow_rating'] != null ? map['allow_rating'] as int : null,
      show_rating:
          map['show_rating'] != null ? map['show_rating'] as int : null,
      average_rating:
          map['average_rating'] != null ? map['average_rating'] as int : null,
      effective_price:
          map['effective_price'] != null ? map['effective_price'] as int : null,
      parent_id: map['parent_id'] != null ? map['parent_id'] as int : null,
      wishlist: map['wishlist'] != null ? map['wishlist'] as bool : null,
    );
  }

  @override
  String toString() {
    return 'SingleProduct(id: $id, sku: $sku, name: $name, slug: $slug, route_id: $route_id, description: $description, excerpt: $excerpt, price: $price, saleprice: $saleprice, free_shipping: $free_shipping, shippable: $shippable, taxable: $taxable, fixed_quantity: $fixed_quantity, dimension: $dimension, track_stock: $track_stock, quantity: $quantity, related_products: $related_products, images: $images, seo_title: $seo_title, meta: $meta, enabled: $enabled, tag: $tag, option_pincodes: $option_pincodes, product_code: $product_code, hsn_code: $hsn_code, affordability: $affordability, allow_rating: $allow_rating, show_rating: $show_rating, average_rating: $average_rating, effective_price: $effective_price, parent_id: $parent_id, wishlist: $wishlist)';
  }
}
