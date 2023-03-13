// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class PaymentModuleOrderSummary {
  final String? order_number;
  PaymentModuleOrderSummary({
    this.order_number,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'order_number': order_number,
    };
  }

  factory PaymentModuleOrderSummary.fromJson(Map<String, dynamic> map) {
    return PaymentModuleOrderSummary(
      order_number:
          map['order_number'] != null ? map['order_number'] as String : null,
    );
  }

  @override
  String toString() => 'PaymentModuleOrderSummary(order_number: $order_number)';
}
