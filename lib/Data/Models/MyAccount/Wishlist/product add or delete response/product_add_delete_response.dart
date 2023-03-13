import 'package:json_annotation/json_annotation.dart';

part 'product_add_delete_response.g.dart';

@JsonSerializable()
class ProductAddDeleteResponse {
  //final ProductAddDeleteData? data;
  final bool? status;
  final String? message;

  ProductAddDeleteResponse(
    this.status,
    this.message,
  );

  factory ProductAddDeleteResponse.fromJson(
          Map<String, dynamic> productAddDeleteData) =>
      _$ProductAddDeleteResponseFromJson(productAddDeleteData);
  Map<String, dynamic> toJson() => _$ProductAddDeleteResponseToJson(this);

  @override
  String toString() =>
      'ProductAddDeleteResponse(status: $status, message: $message)';
}
