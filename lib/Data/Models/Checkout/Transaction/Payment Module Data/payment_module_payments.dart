// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentModulePayments {
  final String? url;
  PaymentModulePayments({
    this.url,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory PaymentModulePayments.fromJson(Map<String, dynamic> map) {
    return PaymentModulePayments(
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  @override
  String toString() => 'PaymentModulePayments(url: $url)';
}
