// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module_customer_details.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module_order_meta.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module_payments.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module_refunds.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module_settlements.dart';

class PaymentModuleData {
  final int? cf_order_id;
  final String? order_id;
  final String? entity;
  final String? order_currency;
  final double? order_amount;
  final String? order_expiry_time;
  final PaymentModuleCustomerDetails? customer_details;
  final PaymentModuleOrderMeta? order_meta;
  final PaymentModuleSettlements? settlements;
  final PaymentModulePayments? payments;
  final PaymentModuleRefunds? refunds;
  final String? order_status;
  final String? order_token;
  final String? payment_link;
  final String? order_tags;

  PaymentModuleData(
      this.cf_order_id,
      this.order_id,
      this.entity,
      this.order_currency,
      this.order_amount,
      this.order_expiry_time,
      this.customer_details,
      this.order_meta,
      this.settlements,
      this.payments,
      this.refunds,
      this.order_status,
      this.order_token,
      this.payment_link,
      this.order_tags);


 
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'cf_order_id': cf_order_id,
      'order_id': order_id,
      'entity': entity,
      'order_currency': order_currency,
      'order_amount': order_amount,
      'order_expiry_time': order_expiry_time,
      'customer_details': customer_details?.toJson(),
      'order_meta': order_meta?.toJson(),
      'settlements': settlements?.toJson(),
      'payments': payments?.toJson(),
      'refunds': refunds?.toJson(),
      'order_status': order_status,
      'order_token': order_token,
      'payment_link': payment_link,
      'order_tags': order_tags,
    };
  }

  factory PaymentModuleData.fromJson(Map<String, dynamic> map) {
    return PaymentModuleData(
      map['cf_order_id'] != null ? map['cf_order_id'] as int : null,
      map['order_id'] != null ? map['order_id'] as String : null,
      map['entity'] != null ? map['entity'] as String : null,
      map['order_currency'] != null ? map['order_currency'] as String : null,
      map['order_amount'] != null ? map['order_amount'] as double : null,
      map['order_expiry_time'] != null ? map['order_expiry_time'] as String : null,
      map['customer_details'] != null ? PaymentModuleCustomerDetails.fromJson(map['customer_details'] as Map<String,dynamic>) : null,
      map['order_meta'] != null ? PaymentModuleOrderMeta.fromJson(map['order_meta'] as Map<String,dynamic>) : null,
      map['settlements'] != null ? PaymentModuleSettlements.fromJson(map['settlements'] as Map<String,dynamic>) : null,
      map['payments'] != null ? PaymentModulePayments.fromJson(map['payments'] as Map<String,dynamic>) : null,
      map['refunds'] != null ? PaymentModuleRefunds.fromJson(map['refunds'] as Map<String,dynamic>) : null,
      map['order_status'] != null ? map['order_status'] as String : null,
      map['order_token'] != null ? map['order_token'] as String : null,
      map['payment_link'] != null ? map['payment_link'] as String : null,
      map['order_tags'] != null ? map['order_tags'] as String : null,
    );
  }

  @override
  String toString() {
    return 'PaymentModuleData(cf_order_id: $cf_order_id, order_id: $order_id, entity: $entity, order_currency: $order_currency, order_amount: $order_amount, order_expiry_time: $order_expiry_time, customer_details: $customer_details, order_meta: $order_meta, settlements: $settlements, payments: $payments, refunds: $refunds, order_status: $order_status, order_token: $order_token, payment_link: $payment_link, order_tags: $order_tags)';
  }
}
