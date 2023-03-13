import 'package:json_annotation/json_annotation.dart';
part 'product_add_delete_data.g.dart';


@JsonSerializable()
class ProductAddDeleteData
{
   
   @JsonKey(name:"responce")
   final String? response;

  ProductAddDeleteData(this.response);

 factory ProductAddDeleteData.fromJson(Map<String, dynamic> productAddDeleteData) =>
      _$ProductAddDeleteDataFromJson(productAddDeleteData);
  Map<String, dynamic> toJson() => _$ProductAddDeleteDataToJson(this);


  

  @override
  String toString() {
    return 'ProductAddDeleteData(response: $response,)';
  }



}