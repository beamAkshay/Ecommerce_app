import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? token;

  @JsonKey(name: "email_subscribe")
  final String? emailSubscribe;
  final String? phone;
  final String? company;

  @JsonKey(name: "default_billing_address")
  final String? defaultBillingAddress;
  @JsonKey(name: "default_shipping_address")
  final String? defaultShippingAddress;
  @JsonKey(name: "ship_to_bill_address")
  final String? shipToBillAddress;
  final String? gst;
  final String? gender;

  @JsonKey(name: "Responce")
  final String? responce;

  UserData(
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.token,
    this.emailSubscribe,
    this.phone,
    this.company,
    this.defaultBillingAddress,
    this.defaultShippingAddress,
    this.shipToBillAddress,
    this.gst,
    this.gender,
    this.responce,
  );

    factory UserData.fromJson(Map<String, dynamic> userData) =>
      _$UserDataFromJson(userData);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  String toString() {
    return 'UserData(id: $id, firstname: $firstname, lastname: $lastname, email: $email, token: $token, emailSubscribe: $emailSubscribe, phone: $phone, company: $company, defaultBillingAddress: $defaultBillingAddress, defaultShippingAddress: $defaultShippingAddress, shipToBillAddress: $shipToBillAddress, gst: $gst, gender: $gender, responce: $responce)';
  }
}
