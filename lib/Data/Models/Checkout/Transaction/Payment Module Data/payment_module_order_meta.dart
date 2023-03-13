// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class PaymentModuleOrderMeta {
  final String? return_url;
  final String? notify_url;
  PaymentModuleOrderMeta({
    this.return_url,
    this.notify_url,
  });
  // "payment_methods": null

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'return_url': return_url,
      'notify_url': notify_url,
    };
  }

  factory PaymentModuleOrderMeta.fromJson(Map<String, dynamic> map) {
    return PaymentModuleOrderMeta(
      return_url: map['return_url'] != null ? map['return_url'] as String : null,
      notify_url: map['notify_url'] != null ? map['notify_url'] as String : null,
    );
  }

  @override
  String toString() => 'PaymentModuleOrderMeta(return_url: $return_url, notify_url: $notify_url)';
}
