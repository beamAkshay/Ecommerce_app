import 'package:json_annotation/json_annotation.dart';

class AddressDetails {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? password;

  @JsonKey(name: "email_subscribe")
  final int? emailSubscribe;
  final String? phone;
  final String? company;

  @JsonKey(name: "default_billing_address")
  final int? defaultBillingAddress;

  @JsonKey(name: "default_shipping_address")
  final int? defaultShippingAddress;

  @JsonKey(name: "ship_to_bill_address")
  final String? shipToBillAddress;

  final String? gst;
  final String? gender;
  AddressDetails({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.emailSubscribe,
    this.phone,
    this.company,
    this.defaultBillingAddress,
    this.defaultShippingAddress,
    this.shipToBillAddress,
    this.gst,
    this.gender,
  });

  factory AddressDetails.fromJson(Map<String, dynamic> json) {
    return AddressDetails(
      id: json['id'] as int?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      emailSubscribe: json['email_subscribe'] as int?,
      phone: json['phone'].toString(),
      company: json['company'] as String?,
      defaultBillingAddress: json['default_billing_address'] as int?,
      defaultShippingAddress: json['default_shipping_address'] as int?,
      shipToBillAddress: json['ship_to_bill_address'] as String?,
      gst: json['gst'].toString(),
      gender: json['gender'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'password': password,
        'email_subscribe': emailSubscribe,
        'phone': phone,
        'company': company,
        'default_billing_address': defaultBillingAddress,
        'default_shipping_address': defaultShippingAddress,
        'ship_to_bill_address': shipToBillAddress,
        'gst': gst,
        'gender': gender,
      };

  @override
  String toString() {
    return 'AddressDetails(id: $id, firstname: $firstname, lastname: $lastname, email: $email, password: $password, emailSubscribe: $emailSubscribe, phone: $phone, company: $company, defaultBillingAddress: $defaultBillingAddress, defaultShippingAddress: $defaultShippingAddress, shipToBillAddress: $shipToBillAddress, gst: $gst, gender: $gender)';
  }
}
