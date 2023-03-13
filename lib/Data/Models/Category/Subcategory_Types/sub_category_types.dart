// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:json_annotation/json_annotation.dart';
part 'sub_category_types.g.dart';

@JsonSerializable()
class SubcategoryTypes {
  // ignore: non_constant_identifier_names
  final int? types_id;
  final String? types_name;
  final String? type_image;
  final String? types_slug;
  final int? saleprice;
  final int? price;
  final int? discount;

  SubcategoryTypes(
    this.types_id,
    this.types_name,
    this.type_image,
    this.types_slug,
    this.saleprice,
    this.price,
    this.discount,
  );

  
factory SubcategoryTypes.fromJson(Map<String, dynamic> subcategoryTypes) =>
      _$SubcategoryTypesFromJson(subcategoryTypes);

Map<String, dynamic> toJson() => _$SubcategoryTypesToJson(this);


  @override
  String toString() {
    return 'SubcategoryTypes(types_id: $types_id, types_name: $types_name, type_image: $type_image, types_slug: $types_slug, saleprice: $saleprice, price: $price, discount: $discount)';
  }


}
