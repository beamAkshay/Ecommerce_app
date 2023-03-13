import 'package:json_annotation/json_annotation.dart';

import 'address_data.dart';

part 'edit_address_list.g.dart';

@JsonSerializable()
class EditAddressList {
  @JsonKey(name: "data")
  AddressData? addressData;

  EditAddressList(this.addressData);

   factory EditAddressList.fromJson(Map<String, dynamic> editAddressList) =>
      _$EditAddressListFromJson(editAddressList);
  Map<String, dynamic> toJson() => _$EditAddressListToJson(this);


  @override
  String toString() => 'EditAddressList(addressData: $addressData)';
}
