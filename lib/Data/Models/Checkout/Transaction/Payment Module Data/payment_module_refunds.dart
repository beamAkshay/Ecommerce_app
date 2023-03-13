// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentModuleRefunds {
  final String? url;
  PaymentModuleRefunds({
    this.url,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory PaymentModuleRefunds.fromJson(Map<String, dynamic> map) {
    return PaymentModuleRefunds(
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  @override
  String toString() => 'PaymentModuleRefunds(url: $url)';
}
