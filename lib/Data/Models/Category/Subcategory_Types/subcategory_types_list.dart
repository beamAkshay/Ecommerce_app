
import 'package:json_annotation/json_annotation.dart';
import 'package:unicorn_store/Data/Models/Category/Subcategory_Types/sub_category_types.dart';

part 'subcategory_types_list.g.dart';

@JsonSerializable()
class SubcategoryTypesList {

  List<SubcategoryTypes>? data;

  SubcategoryTypesList({
    this.data,
  });

  
  factory SubcategoryTypesList.fromJson(Map<String, dynamic> subcategoryTypesList) =>
      _$SubcategoryTypesListFromJson(subcategoryTypesList);
  Map<String, dynamic> toJson() => _$SubcategoryTypesListToJson(this);
  

  @override
  String toString() => 'SubcategoryTypesList(subcategoryTypes: $data)';
}
