// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class PaymentModuleCustomerDetails {
  final String? customer_id;
  final String? customer_name;
  final String? customer_email;
  final String? customer_phone;

  PaymentModuleCustomerDetails(this.customer_id, this.customer_name,
      this.customer_email, this.customer_phone);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'customer_id': customer_id,
      'customer_name': customer_name,
      'customer_email': customer_email,
      'customer_phone': customer_phone,
    };
  }

  factory PaymentModuleCustomerDetails.fromJson(Map<String, dynamic> map) {
    return PaymentModuleCustomerDetails(
      map['customer_id'] != null ? map['customer_id'] as String : null,
      map['customer_name'] != null ? map['customer_name'] as String : null,
      map['customer_email'] != null ? map['customer_email'] as String : null,
      map['customer_phone'] != null ? map['customer_phone'] as String : null,
    );
  }

  @override
  String toString() {
    return 'PaymentModuleCustomerDetails(customer_id: $customer_id, customer_name: $customer_name, customer_email: $customer_email, customer_phone: $customer_phone)';
  }
}
