// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/Product/New%20Product/type_image.dart';

class FilterProductDetails {
  final int? id;
  final String? name;
  final List<TypeImage>? images;
  final int? price;
  final String? slug;
  final int? count;
  FilterProductDetails({
    this.id,
    this.name,
    this.images,
    this.price,
    this.slug,
    this.count,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'images': images!.map((x) => x.toJson()).toList(),
      'price': price,
      'slug': slug,
      'count': count,
    };
  }

  factory FilterProductDetails.fromJson(Map<String, dynamic> map) {
    return FilterProductDetails(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      images: map['images'] != null ? List<TypeImage>.from((map['images'] as List<dynamic>).map<TypeImage?>((x) => TypeImage.fromJson(x as Map<String,dynamic>),),) : null,
      price: map['price'] != null ? map['price'] as int : null,
      slug: map['slug'] != null ? map['slug'] as String : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  @override
  String toString() {
    return 'FilterProductDetails(id: $id, name: $name, images: $images, price: $price, slug: $slug, count: $count)';
  }
}
