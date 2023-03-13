// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';

part 'address_list.g.dart';

@JsonSerializable()
class AddressList {
  @JsonKey(name: "data")
  List<Address>? address;

  final bool? status;

  AddressList(
    this.address,
    this.status,
  );

  factory AddressList.fromJson(Map<String, dynamic> addressList) =>
      _$AddressListFromJson(addressList);
  Map<String, dynamic> toJson() => _$AddressListToJson(this);

  @override
  String toString() {
    return 'AddressList(address: $address)';
  }
}
