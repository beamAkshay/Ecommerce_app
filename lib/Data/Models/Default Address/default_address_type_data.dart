// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:unicorn_store/Data/Models/Default%20Address/default_billing_address_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default_shipping_address_data.dart';

class DefaultAddressType {
  final DefaultShippingAddress? default_shipping_address;
  final DefaultBillingAddress? default_billing_address;
  DefaultAddressType({
    this.default_shipping_address,
    this.default_billing_address,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'default_shipping_address': default_shipping_address?.toJson(),
      'default_billing_address': default_billing_address?.toJson(),
    };
  }

  factory DefaultAddressType.fromJson(Map<String, dynamic> map) {
    return DefaultAddressType(
      default_shipping_address: map['default_shipping_address'] != null
          ? DefaultShippingAddress.fromJson(
              map['default_shipping_address'] as Map<String, dynamic>)
          : null,
      default_billing_address: map['default_billing_address'] != null
          ? DefaultBillingAddress.fromJson(
              map['default_billing_address'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() =>
      'DefaultAddressType(default_shipping_address: $default_shipping_address, default_billing_address: $default_billing_address)';
}
