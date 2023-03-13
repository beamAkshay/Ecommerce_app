import 'package:json_annotation/json_annotation.dart';

part 'search_zip_address.g.dart';

@JsonSerializable()
class SearchZipAddress {
  final String? pincode;
  final String? divisionname;
  final String? statename;

  @JsonKey(name: "state_id")
  final String? stateId;

  @JsonKey(name: "country_id")
  final String? countryId;

  @JsonKey(name: "country_name")
  final String? countryName;

  @JsonKey(name: "zip_required")
  final String? zipRequired;

  SearchZipAddress(this.pincode, this.divisionname, this.statename,
      this.stateId, this.countryId, this.countryName, this.zipRequired);

  factory SearchZipAddress.fromJson(Map<String, dynamic> searchZipAddress) =>
      _$SearchZipAddressFromJson(searchZipAddress);
  Map<String, dynamic> toJson() => _$SearchZipAddressToJson(this);

  @override
  String toString() {
    return 'SearchZipAddress(pincode: $pincode, divisionname: $divisionname, statename: $statename, stateId: $stateId, countryId: $countryId, countryName: $countryName, zipRequired: $zipRequired)';
  }
}
