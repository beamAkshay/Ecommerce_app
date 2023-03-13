// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/Product/New%20Product/single_product.dart';

class SingleProductData {
  final bool? status;
  final SingleProduct? data;

  SingleProductData(this.status, this.data);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data?.toJson(),
    };
  }

  factory SingleProductData.fromJson(Map<String, dynamic> map) {
    return SingleProductData(
      map['status'] != null ? map['status'] as bool : null,
      map['data'] != null ? SingleProduct.fromJson(map['data'] as Map<String,dynamic>) : null,
    );
  }

  @override
  String toString() => 'SingleProductData(status: $status, data: $data)';
}
