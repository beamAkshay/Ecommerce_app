import 'package:json_annotation/json_annotation.dart';

import 'package:unicorn_store/Data/Models/Category/AccessoriesCategory/accessories_data.dart';
part 'accessories_list_data.g.dart';

@JsonSerializable()
class AccessoriesListData {

  final AccessoriesData? data;
  
  AccessoriesListData(this.data);

  factory AccessoriesListData.fromJson(Map<String, dynamic> accessoriesData) =>
      _$AccessoriesListDataFromJson(accessoriesData);

  Map<String, dynamic> toJson() => _$AccessoriesListDataToJson(this);

  @override
  String toString() => 'AccessoriesListData(data: $data)';
}
