// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class OrderSummaryProductData {
  final String? payment_id;
  final String? company;
  final String? ship_country;
  final int? bill_country_id;
  final String? other_details;
  final double? coupon_discount;
  final String? ship_phone;
  final String? bill_address2;
  final int? store_id;
  final int? customer_id;
  final String? firstname;
  final String? ship_country_code;
  final int? store_pickup;
  final double? shipping;
  final String? ship_address1;
  final String? bill_city;
  final String? ship_email;
  final String? status;
  final String? lastname;
  final int? ship_country_id;
  final int? is_home;
  final String? shipping_notes;
  final String? ship_address2;
  final String? bill_zip;
  final String? pincode;
  final String? ordered_on;
  final String? phone;
  final String? bill_company;
  final String? device_token;
  final String? shipping_method;
  final String? ship_city;
  final String? bill_zone;
  final int? fast_shipping;
  final String? shipped_on;
  final String? email;
  final String? bill_firstname;
  final String? bill_address1;
  final String? source;
  final String? notes;
  final String? ship_zip;
  final int? bill_zone_id;
  final int? etd;
  final double? tax;
  final String? ship_company;
  final String? bill_lastname;
  final String? gst;
  final int? id;
  final String? payment_info;
  final String? ship_zone;
  final String? bill_country;
  final int? review_given;
  final double? total;
  final String? ship_firstname;
  final String? bill_email;
  final String? shipping_class;
  final int? affordability;
  final String? order_number;
  final String? referral;
  final int? ship_zone_id;
  final String? bill_country_code;
  final int? order_type;
  final double? subtotal;
  final String? ship_lastname;
  final String? bill_phone;
  final String? tracking_ids;
  final double? gift_card_discount;
  final String? gst_applicable;
  final String? gst_percent;
  OrderSummaryProductData({
    this.payment_id,
    this.company,
    this.ship_country,
    this.bill_country_id,
    this.other_details,
    this.coupon_discount,
    this.ship_phone,
    this.bill_address2,
    this.store_id,
    this.customer_id,
    this.firstname,
    this.ship_country_code,
    this.store_pickup,
    this.shipping,
    this.ship_address1,
    this.bill_city,
    this.ship_email,
    this.status,
    this.lastname,
    this.ship_country_id,
    this.is_home,
    this.shipping_notes,
    this.ship_address2,
    this.bill_zip,
    this.pincode,
    this.ordered_on,
    this.phone,
    this.bill_company,
    this.device_token,
    this.shipping_method,
    this.ship_city,
    this.bill_zone,
    this.fast_shipping,
    this.shipped_on,
    this.email,
    this.bill_firstname,
    this.bill_address1,
    this.source,
    this.notes,
    this.ship_zip,
    this.bill_zone_id,
    this.etd,
    this.tax,
    this.ship_company,
    this.bill_lastname,
    this.gst,
    this.id,
    this.payment_info,
    this.ship_zone,
    this.bill_country,
    this.review_given,
    this.total,
    this.ship_firstname,
    this.bill_email,
    this.shipping_class,
    this.affordability,
    this.order_number,
    this.referral,
    this.ship_zone_id,
    this.bill_country_code,
    this.order_type,
    this.subtotal,
    this.ship_lastname,
    this.bill_phone,
    this.tracking_ids,
    this.gift_card_discount,
    this.gst_applicable,
    this.gst_percent,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'payment_id': payment_id,
      'company': company,
      'ship_country': ship_country,
      'bill_country_id': bill_country_id,
      'other_details': other_details,
      'coupon_discount': coupon_discount,
      'ship_phone': ship_phone,
      'bill_address2': bill_address2,
      'store_id': store_id,
      'customer_id': customer_id,
      'firstname': firstname,
      'ship_country_code': ship_country_code,
      'store_pickup': store_pickup,
      'shipping': shipping,
      'ship_address1': ship_address1,
      'bill_city': bill_city,
      'ship_email': ship_email,
      'status': status,
      'lastname': lastname,
      'ship_country_id': ship_country_id,
      'is_home': is_home,
      'shipping_notes': shipping_notes,
      'ship_address2': ship_address2,
      'bill_zip': bill_zip,
      'pincode': pincode,
      'ordered_on': ordered_on,
      'phone': phone,
      'bill_company': bill_company,
      'device_token': device_token,
      'shipping_method': shipping_method,
      'ship_city': ship_city,
      'bill_zone': bill_zone,
      'fast_shipping': fast_shipping,
      'shipped_on': shipped_on,
      'email': email,
      'bill_firstname': bill_firstname,
      'bill_address1': bill_address1,
      'source': source,
      'notes': notes,
      'ship_zip': ship_zip,
      'bill_zone_id': bill_zone_id,
      'etd': etd,
      'tax': tax,
      'ship_company': ship_company,
      'bill_lastname': bill_lastname,
      'gst': gst,
      'id': id,
      'payment_info': payment_info,
      'ship_zone': ship_zone,
      'bill_country': bill_country,
      'review_given': review_given,
      'total': total,
      'ship_firstname': ship_firstname,
      'bill_email': bill_email,
      'shipping_class': shipping_class,
      'affordability': affordability,
      'order_number': order_number,
      'referral': referral,
      'ship_zone_id': ship_zone_id,
      'bill_country_code': bill_country_code,
      'order_type': order_type,
      'subtotal': subtotal,
      'ship_lastname': ship_lastname,
      'bill_phone': bill_phone,
      'tracking_ids': tracking_ids,
      'gift_card_discount': gift_card_discount,
      'gst_applicable': gst_applicable,
      'gst_percent': gst_percent,
    };
  }

  factory OrderSummaryProductData.fromJson(Map<String, dynamic> map) {
    return OrderSummaryProductData(
      payment_id: map['payment_id'] != null ? map['payment_id'] as String : null,
      company: map['company'] != null ? map['company'] as String : null,
      ship_country: map['ship_country'] != null ? map['ship_country'] as String : null,
      bill_country_id: map['bill_country_id'] != null ? map['bill_country_id'] as int : null,
      other_details: map['other_details'] != null ? map['other_details'] as String : null,
      coupon_discount: map['coupon_discount'] != null ? map['coupon_discount'] as double : null,
      ship_phone: map['ship_phone'] != null ? map['ship_phone'] as String : null,
      bill_address2: map['bill_address2'] != null ? map['bill_address2'] as String : null,
      store_id: map['store_id'] != null ? map['store_id'] as int : null,
      customer_id: map['customer_id'] != null ? map['customer_id'] as int : null,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      ship_country_code: map['ship_country_code'] != null ? map['ship_country_code'] as String : null,
      store_pickup: map['store_pickup'] != null ? map['store_pickup'] as int : null,
      shipping: map['shipping'] != null ? map['shipping'] as double : null,
      ship_address1: map['ship_address1'] != null ? map['ship_address1'] as String : null,
      bill_city: map['bill_city'] != null ? map['bill_city'] as String : null,
      ship_email: map['ship_email'] != null ? map['ship_email'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      ship_country_id: map['ship_country_id'] != null ? map['ship_country_id'] as int : null,
      is_home: map['is_home'] != null ? map['is_home'] as int : null,
      shipping_notes: map['shipping_notes'] != null ? map['shipping_notes'] as String : null,
      ship_address2: map['ship_address2'] != null ? map['ship_address2'] as String : null,
      bill_zip: map['bill_zip'] != null ? map['bill_zip'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
      ordered_on: map['ordered_on'] != null ? map['ordered_on'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      bill_company: map['bill_company'] != null ? map['bill_company'] as String : null,
      device_token: map['device_token'] != null ? map['device_token'] as String : null,
      shipping_method: map['shipping_method'] != null ? map['shipping_method'] as String : null,
      ship_city: map['ship_city'] != null ? map['ship_city'] as String : null,
      bill_zone: map['bill_zone'] != null ? map['bill_zone'] as String : null,
      fast_shipping: map['fast_shipping'] != null ? map['fast_shipping'] as int : null,
      shipped_on: map['shipped_on'] != null ? map['shipped_on'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      bill_firstname: map['bill_firstname'] != null ? map['bill_firstname'] as String : null,
      bill_address1: map['bill_address1'] != null ? map['bill_address1'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      ship_zip: map['ship_zip'] != null ? map['ship_zip'] as String : null,
      bill_zone_id: map['bill_zone_id'] != null ? map['bill_zone_id'] as int : null,
      etd: map['etd'] != null ? map['etd'] as int : null,
      tax: map['tax'] != null ? map['tax'] as double : null,
      ship_company: map['ship_company'] != null ? map['ship_company'] as String : null,
      bill_lastname: map['bill_lastname'] != null ? map['bill_lastname'] as String : null,
      gst: map['gst'] != null ? map['gst'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      payment_info: map['payment_info'] != null ? map['payment_info'] as String : null,
      ship_zone: map['ship_zone'] != null ? map['ship_zone'] as String : null,
      bill_country: map['bill_country'] != null ? map['bill_country'] as String : null,
      review_given: map['review_given'] != null ? map['review_given'] as int : null,
      total: map['total'] != null ? map['total'] as double : null,
      ship_firstname: map['ship_firstname'] != null ? map['ship_firstname'] as String : null,
      bill_email: map['bill_email'] != null ? map['bill_email'] as String : null,
      shipping_class: map['shipping_class'] != null ? map['shipping_class'] as String : null,
      affordability: map['affordability'] != null ? map['affordability'] as int : null,
      order_number: map['order_number'] != null ? map['order_number'] as String : null,
      referral: map['referral'] != null ? map['referral'] as String : null,
      ship_zone_id: map['ship_zone_id'] != null ? map['ship_zone_id'] as int : null,
      bill_country_code: map['bill_country_code'] != null ? map['bill_country_code'] as String : null,
      order_type: map['order_type'] != null ? map['order_type'] as int : null,
      subtotal: map['subtotal'] != null ? map['subtotal'] as double : null,
      ship_lastname: map['ship_lastname'] != null ? map['ship_lastname'] as String : null,
      bill_phone: map['bill_phone'] != null ? map['bill_phone'] as String : null,
      tracking_ids: map['tracking_ids'] != null ? map['tracking_ids'] as String : null,
      gift_card_discount: map['gift_card_discount'] != null ? map['gift_card_discount'] as double : null,
      gst_applicable: map['gst_applicable'] != null ? map['gst_applicable'] as String : null,
      gst_percent: map['gst_percent'] != null ? map['gst_percent'] as String : null,
    );
  }

  @override
  String toString() {
    return 'OrderSummaryProductData(payment_id: $payment_id, company: $company, ship_country: $ship_country, bill_country_id: $bill_country_id, other_details: $other_details, coupon_discount: $coupon_discount, ship_phone: $ship_phone, bill_address2: $bill_address2, store_id: $store_id, customer_id: $customer_id, firstname: $firstname, ship_country_code: $ship_country_code, store_pickup: $store_pickup, shipping: $shipping, ship_address1: $ship_address1, bill_city: $bill_city, ship_email: $ship_email, status: $status, lastname: $lastname, ship_country_id: $ship_country_id, is_home: $is_home, shipping_notes: $shipping_notes, ship_address2: $ship_address2, bill_zip: $bill_zip, pincode: $pincode, ordered_on: $ordered_on, phone: $phone, bill_company: $bill_company, device_token: $device_token, shipping_method: $shipping_method, ship_city: $ship_city, bill_zone: $bill_zone, fast_shipping: $fast_shipping, shipped_on: $shipped_on, email: $email, bill_firstname: $bill_firstname, bill_address1: $bill_address1, source: $source, notes: $notes, ship_zip: $ship_zip, bill_zone_id: $bill_zone_id, etd: $etd, tax: $tax, ship_company: $ship_company, bill_lastname: $bill_lastname, gst: $gst, id: $id, payment_info: $payment_info, ship_zone: $ship_zone, bill_country: $bill_country, review_given: $review_given, total: $total, ship_firstname: $ship_firstname, bill_email: $bill_email, shipping_class: $shipping_class, affordability: $affordability, order_number: $order_number, referral: $referral, ship_zone_id: $ship_zone_id, bill_country_code: $bill_country_code, order_type: $order_type, subtotal: $subtotal, ship_lastname: $ship_lastname, bill_phone: $bill_phone, tracking_ids: $tracking_ids, gift_card_discount: $gift_card_discount, gst_applicable: $gst_applicable, gst_percent: $gst_percent)';
  }
}
