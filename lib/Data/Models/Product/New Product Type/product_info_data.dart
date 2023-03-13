// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/product_data.dart';

class ProductInfoData {
  final bool? status;
  final ProductData? data;

  ProductInfoData(this.status, this.data);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data?.toJson(),
    };
  }

  factory ProductInfoData.fromJson(Map<String, dynamic> map) {
    return ProductInfoData(
      map['status'] != null ? map['status'] as bool : null,
      map['data'] != null ? ProductData.fromJson(map['data'] as Map<String,dynamic>) : null,
    );
  }

  @override
  String toString() => 'ProductInfoData(status: $status, data: $data)';
}
