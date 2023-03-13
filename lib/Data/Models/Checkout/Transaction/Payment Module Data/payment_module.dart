// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module_data.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module_order_summary.dart';

class PaymentModule {
  final bool? status;
  final PaymentModuleData? data;
  final PaymentModuleOrderSummary? order_summary;
  PaymentModule({
    this.status,
    this.data,
    this.order_summary,
  });


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'data': data?.toJson(),
      'order_summary': order_summary?.toJson(),
    };
  }

  factory PaymentModule.fromJson(Map<String, dynamic> map) {
    return PaymentModule(
      status: map['status'] != null ? map['status'] as bool : null,
      data: map['data'] != null ? PaymentModuleData.fromJson(map['data'] as Map<String,dynamic>) : null,
      order_summary: map['order_summary'] != null ? PaymentModuleOrderSummary.fromJson(map['order_summary'] as Map<String,dynamic>) : null,
    );
  }

  @override
  String toString() => 'PaymentModule(status: $status, data: $data, order_summary: $order_summary)';
}
