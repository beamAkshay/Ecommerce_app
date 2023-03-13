// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentModuleSettlements {
  final String? url;

  PaymentModuleSettlements(this.url);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory PaymentModuleSettlements.fromJson(Map<String, dynamic> map) {
    return PaymentModuleSettlements(
      map['url'] != null ? map['url'] as String : null,
    );
  }

  @override
  String toString() => 'PaymentModuleSettlements(url: $url)';
}
