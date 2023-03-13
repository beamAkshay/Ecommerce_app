// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:unicorn_store/Data/Models/Checkout/Order%20Summary/order_summary_product_data.dart';

class OrderSummaryData {
  final bool? status;
  final OrderSummaryProductData data;

  OrderSummaryData(this.status, this.data);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data.toJson(),
    };
  }

  factory OrderSummaryData.fromJson(Map<String, dynamic> map) {
    return OrderSummaryData(
      map['status'] != null ? map['status'] as bool : null,
      OrderSummaryProductData.fromJson(map['data'] as Map<String,dynamic>),
    );
  }

  @override
  String toString() => 'OrderSummaryProductData(status: $status, data: $data)';
}
