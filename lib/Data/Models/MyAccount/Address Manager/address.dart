import 'package:json_annotation/json_annotation.dart';

import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/field_data.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final int? id;

  @JsonKey(name: "customer_id")
  final int? customerId;

  @JsonKey(name: "entry_name")
  final String? entryName;

  @JsonKey(name: "field_data")
  final AddressFieldData? addressFieldData;

  @JsonKey(name: "default_billing_address")
  final bool? defaultBillingAddress;

  @JsonKey(name: "default_shipping_address")
  final bool? defaultsShippingAddress;


  Address(this.id, this.customerId, this.entryName, this.addressFieldData,this.defaultBillingAddress,this.defaultsShippingAddress);

   factory Address.fromJson(Map<String, dynamic> address) =>
      _$AddressFromJson(address);
  Map<String, dynamic> toJson() => _$AddressToJson(this);



  @override
  String toString() {
    return 'Address(id: $id, customerId: $customerId, entryName: $entryName, addressFieldData: $addressFieldData, defaultBillingAddress: $defaultBillingAddress, defaultsShippingAddress: $defaultsShippingAddress)';
  }
}
