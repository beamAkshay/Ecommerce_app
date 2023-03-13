// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history_product.dart';

class OrderHistoryData {
  final int? id;
  final int? order_number;
  final String? payment_id;
  final int? customer_id;
  final String? status;
  final String? ordered_on;
  final String? shipped_on;
  final int? tax;
  final int? total;
  final int? subtotal;
  final int? gift_card_discount;
  final int? coupon_discount;
  final int? shipping;
  final int? shipping_notes;
  final int? shipping_method;
  final String? notes;
  final String? payment_info;
  final String? referral;
  final String? company;
  final String? firstname;
  final String? lastname;
  final int? phone;
  final String? email;
  final String? ship_company;
  final String? ship_firstname;
  final String? ship_lastname;
  final String? ship_email;
  final int? ship_phone;
  final String? ship_address1;
  final String? ship_address2;
  final String? ship_city;
  final int? ship_zip;
  final String? ship_zone;
  final int? ship_zone_id;
  final String? ship_country;
  final String? ship_country_code;
  final int? ship_country_id;
  final String? bill_company;
  final String? bill_firstname;
  final String? bill_lastname;
  final String? bill_email;
  final int? bill_phone;
  final String? bill_address1;
  final String? bill_address2;
  final String? bill_city;
  final int? bill_zip;
  final String? bill_zone;
  final int? bill_zone_id;
  final String? bill_country;
  final String? bill_country_code;
  final int? bill_country_id;
  final int? store_pickup;
  final int? is_home;
  final String? device_token;
  final String? source;
  final int? gst;
  final String? shipping_class;
  final String? tracking_ids;
  final int? affordability;
  final int? store_id;
  final int? payment_checksum;
  final String? pincode;
  final int? fast_shipping;
  final int? etd;
  final int? review_given;
  final int? order_type;
  final String? other_details;
  final List<OrderHistoryProduct>? product;

  OrderHistoryData(this.id, this.order_number, this.payment_id, this.customer_id, this.status, this.ordered_on, this.shipped_on, this.tax, this.total, this.subtotal, this.gift_card_discount, this.coupon_discount, this.shipping, this.shipping_notes, this.shipping_method, this.notes, this.payment_info, this.referral, this.company, this.firstname, this.lastname, this.phone, this.email, this.ship_company, this.ship_firstname, this.ship_lastname, this.ship_email, this.ship_phone, this.ship_address1, this.ship_address2, this.ship_city, this.ship_zip, this.ship_zone, this.ship_zone_id, this.ship_country, this.ship_country_code, this.ship_country_id, this.bill_company, this.bill_firstname, this.bill_lastname, this.bill_email, this.bill_phone, this.bill_address1, this.bill_address2, this.bill_city, this.bill_zip, this.bill_zone, this.bill_zone_id, this.bill_country, this.bill_country_code, this.bill_country_id, this.store_pickup, this.is_home, this.device_token, this.source, this.gst, this.shipping_class, this.tracking_ids, this.affordability, this.store_id, this.payment_checksum, this.pincode, this.fast_shipping, this.etd, this.review_given, this.order_type, this.other_details, this.product);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'order_number': order_number,
      'payment_id': payment_id,
      'customer_id': customer_id,
      'status': status,
      'ordered_on': ordered_on,
      'shipped_on': shipped_on,
      'tax': tax,
      'total': total,
      'subtotal': subtotal,
      'gift_card_discount': gift_card_discount,
      'coupon_discount': coupon_discount,
      'shipping': shipping,
      'shipping_notes': shipping_notes,
      'shipping_method': shipping_method,
      'notes': notes,
      'payment_info': payment_info,
      'referral': referral,
      'company': company,
      'firstname': firstname,
      'lastname': lastname,
      'phone': phone,
      'email': email,
      'ship_company': ship_company,
      'ship_firstname': ship_firstname,
      'ship_lastname': ship_lastname,
      'ship_email': ship_email,
      'ship_phone': ship_phone,
      'ship_address1': ship_address1,
      'ship_address2': ship_address2,
      'ship_city': ship_city,
      'ship_zip': ship_zip,
      'ship_zone': ship_zone,
      'ship_zone_id': ship_zone_id,
      'ship_country': ship_country,
      'ship_country_code': ship_country_code,
      'ship_country_id': ship_country_id,
      'bill_company': bill_company,
      'bill_firstname': bill_firstname,
      'bill_lastname': bill_lastname,
      'bill_email': bill_email,
      'bill_phone': bill_phone,
      'bill_address1': bill_address1,
      'bill_address2': bill_address2,
      'bill_city': bill_city,
      'bill_zip': bill_zip,
      'bill_zone': bill_zone,
      'bill_zone_id': bill_zone_id,
      'bill_country': bill_country,
      'bill_country_code': bill_country_code,
      'bill_country_id': bill_country_id,
      'store_pickup': store_pickup,
      'is_home': is_home,
      'device_token': device_token,
      'source': source,
      'gst': gst,
      'shipping_class': shipping_class,
      'tracking_ids': tracking_ids,
      'affordability': affordability,
      'store_id': store_id,
      'payment_checksum': payment_checksum,
      'pincode': pincode,
      'fast_shipping': fast_shipping,
      'etd': etd,
      'review_given': review_given,
      'order_type': order_type,
      'other_details': other_details,
      'product': product!.map((x) => x.toJson()).toList(),
    };
  }

  factory OrderHistoryData.fromJson(Map<String, dynamic> map) {
    return OrderHistoryData(
      map['id'] != null ? map['id'] as int : null,
      map['order_number'] != null ? map['order_number'] as int : null,
      map['payment_id'] != null ? map['payment_id'] as String : null,
      map['customer_id'] != null ? map['customer_id'] as int : null,
      map['status'] != null ? map['status'] as String : null,
      map['ordered_on'] != null ? map['ordered_on'] as String : null,
      map['shipped_on'] != null ? map['shipped_on'] as String : null,
      map['tax'] != null ? map['tax'] as int : null,
      map['total'] != null ? map['total'] as int : null,
      map['subtotal'] != null ? map['subtotal'] as int : null,
      map['gift_card_discount'] != null ? map['gift_card_discount'] as int : null,
      map['coupon_discount'] != null ? map['coupon_discount'] as int : null,
      map['shipping'] != null ? map['shipping'] as int : null,
      map['shipping_notes'] != null ? map['shipping_notes'] as int : null,
      map['shipping_method'] != null ? map['shipping_method'] as int : null,
      map['notes'] != null ? map['notes'] as String : null,
      map['payment_info'] != null ? map['payment_info'] as String : null,
      map['referral'] != null ? map['referral'] as String : null,
      map['company'] != null ? map['company'] as String : null,
      map['firstname'] != null ? map['firstname'] as String : null,
      map['lastname'] != null ? map['lastname'] as String : null,
      map['phone'] != null ? map['phone'] as int : null,
      map['email'] != null ? map['email'] as String : null,
      map['ship_company'] != null ? map['ship_company'] as String : null,
      map['ship_firstname'] != null ? map['ship_firstname'] as String : null,
      map['ship_lastname'] != null ? map['ship_lastname'] as String : null,
      map['ship_email'] != null ? map['ship_email'] as String : null,
      map['ship_phone'] != null ? map['ship_phone'] as int : null,
      map['ship_address1'] != null ? map['ship_address1'] as String : null,
      map['ship_address2'] != null ? map['ship_address2'] as String : null,
      map['ship_city'] != null ? map['ship_city'] as String : null,
      map['ship_zip'] != null ? map['ship_zip'] as int : null,
      map['ship_zone'] != null ? map['ship_zone'] as String : null,
      map['ship_zone_id'] != null ? map['ship_zone_id'] as int : null,
      map['ship_country'] != null ? map['ship_country'] as String : null,
      map['ship_country_code'] != null ? map['ship_country_code'] as String : null,
      map['ship_country_id'] != null ? map['ship_country_id'] as int : null,
      map['bill_company'] != null ? map['bill_company'] as String : null,
      map['bill_firstname'] != null ? map['bill_firstname'] as String : null,
      map['bill_lastname'] != null ? map['bill_lastname'] as String : null,
      map['bill_email'] != null ? map['bill_email'] as String : null,
      map['bill_phone'] != null ? map['bill_phone'] as int : null,
      map['bill_address1'] != null ? map['bill_address1'] as String : null,
      map['bill_address2'] != null ? map['bill_address2'] as String : null,
      map['bill_city'] != null ? map['bill_city'] as String : null,
      map['bill_zip'] != null ? map['bill_zip'] as int : null,
      map['bill_zone'] != null ? map['bill_zone'] as String : null,
      map['bill_zone_id'] != null ? map['bill_zone_id'] as int : null,
      map['bill_country'] != null ? map['bill_country'] as String : null,
      map['bill_country_code'] != null ? map['bill_country_code'] as String : null,
      map['bill_country_id'] != null ? map['bill_country_id'] as int : null,
      map['store_pickup'] != null ? map['store_pickup'] as int : null,
      map['is_home'] != null ? map['is_home'] as int : null,
      map['device_token'] != null ? map['device_token'] as String : null,
      map['source'] != null ? map['source'] as String : null,
      map['gst'] != null ? map['gst'] as int : null,
      map['shipping_class'] != null ? map['shipping_class'] as String : null,
      map['tracking_ids'] != null ? map['tracking_ids'] as String : null,
      map['affordability'] != null ? map['affordability'] as int : null,
      map['store_id'] != null ? map['store_id'] as int : null,
      map['payment_checksum'] != null ? map['payment_checksum'] as int : null,
      map['pincode'] != null ? map['pincode'] as String : null,
      map['fast_shipping'] != null ? map['fast_shipping'] as int : null,
      map['etd'] != null ? map['etd'] as int : null,
      map['review_given'] != null ? map['review_given'] as int : null,
      map['order_type'] != null ? map['order_type'] as int : null,
      map['other_details'] != null ? map['other_details'] as String : null,
      map['product'] != null ? List<OrderHistoryProduct>.from((map['product'] as List<dynamic>).map<OrderHistoryProduct?>((x) => OrderHistoryProduct.fromJson(x as Map<String,dynamic>),),) : null,
    );
  }

  @override
  String toString() {
    return 'OrderHistoryData(id: $id, order_number: $order_number, payment_id: $payment_id, customer_id: $customer_id, status: $status, ordered_on: $ordered_on, shipped_on: $shipped_on, tax: $tax, total: $total, subtotal: $subtotal, gift_card_discount: $gift_card_discount, coupon_discount: $coupon_discount, shipping: $shipping, shipping_notes: $shipping_notes, shipping_method: $shipping_method, notes: $notes, payment_info: $payment_info, referral: $referral, company: $company, firstname: $firstname, lastname: $lastname, phone: $phone, email: $email, ship_company: $ship_company, ship_firstname: $ship_firstname, ship_lastname: $ship_lastname, ship_email: $ship_email, ship_phone: $ship_phone, ship_address1: $ship_address1, ship_address2: $ship_address2, ship_city: $ship_city, ship_zip: $ship_zip, ship_zone: $ship_zone, ship_zone_id: $ship_zone_id, ship_country: $ship_country, ship_country_code: $ship_country_code, ship_country_id: $ship_country_id, bill_company: $bill_company, bill_firstname: $bill_firstname, bill_lastname: $bill_lastname, bill_email: $bill_email, bill_phone: $bill_phone, bill_address1: $bill_address1, bill_address2: $bill_address2, bill_city: $bill_city, bill_zip: $bill_zip, bill_zone: $bill_zone, bill_zone_id: $bill_zone_id, bill_country: $bill_country, bill_country_code: $bill_country_code, bill_country_id: $bill_country_id, store_pickup: $store_pickup, is_home: $is_home, device_token: $device_token, source: $source, gst: $gst, shipping_class: $shipping_class, tracking_ids: $tracking_ids, affordability: $affordability, store_id: $store_id, payment_checksum: $payment_checksum, pincode: $pincode, fast_shipping: $fast_shipping, etd: $etd, review_given: $review_given, order_type: $order_type, other_details: $other_details, product: $product)';
  }
}
