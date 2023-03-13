import 'package:json_annotation/json_annotation.dart';
import '../field_data.dart';
part 'address_data.g.dart';

@JsonSerializable()
class AddressData {
  final int? id;

  @JsonKey(name: "customer_id")
  final int? customerId;

  @JsonKey(name: "entry_name")
  final String? entryName;

  @JsonKey(name: "field_data")
  final AddressFieldData? fieldDataEditAddress;

  AddressData(
    this.id,
    this.customerId,
    this.entryName,
    this.fieldDataEditAddress,
  );

  factory AddressData.fromJson(Map<String, dynamic> address) =>
      _$AddressDataFromJson(address);
  Map<String, dynamic> toJson() => _$AddressDataToJson(this);

  @override
  String toString() {
    return 'Address(id: $id, customerId: $customerId, entryName: $entryName, fieldDataEditAddress: $fieldDataEditAddress,)';
  }
}
