import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/Category/Subcategory/subcategory_data.dart';
part 'subcategory_list.g.dart';

@JsonSerializable()
class SubCategoryList {

  SubcategoryData? data;

  SubCategoryList({this.data});

  factory SubCategoryList.fromJson(Map<String, dynamic> category) =>
      _$SubCategoryListFromJson(category);
  Map<String, dynamic> toJson() => _$SubCategoryListToJson(this);


  @override
  String toString() => 'SubCategoryList(data: $data)';
}
