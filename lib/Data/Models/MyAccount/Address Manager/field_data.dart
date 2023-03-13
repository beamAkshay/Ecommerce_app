import 'package:json_annotation/json_annotation.dart';

part 'field_data.g.dart';

@JsonSerializable()
class AddressFieldData {
  final String? lastname;
  final String? firstname;
  final String? email;
  final int? phone;
  final String? address1;
  final String? address2;
  final String? city;
  final int? zip;
  final String? zone;
  final String? country;

  @JsonKey(name: "country_code")
  final String? countryCode;

  @JsonKey(name: "country_id")
  final int? countryId;

  @JsonKey(name: "zone_id")
  final int? zoneId;

  AddressFieldData(
      this.lastname,
      this.firstname,
      this.email,
      this.phone,
      this.address1,
      this.address2,
      this.city,
      this.zip,
      this.zone,
      this.country,
      this.countryCode,
      this.countryId,
      this.zoneId);

  factory AddressFieldData.fromJson(Map<String, dynamic> addressFieldData) =>
      _$AddressFieldDataFromJson(addressFieldData);
  Map<String, dynamic> toJson() => _$AddressFieldDataToJson(this);

  @override
  String toString() {
    return 'AddressFieldData(lastname: $lastname, firstname: $firstname, email: $email, phone: $phone, address1: $address1, address2: $address2, city: $city, zip: $zip, zone: $zone, country: $country, countryCode: $countryCode, countryId: $countryId, zoneId: $zoneId)';
  }
}
