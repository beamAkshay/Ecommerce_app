import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'country_list.g.dart';

@JsonSerializable()
class CountryList {
  @JsonKey(name: "data")
  final List<Country>? country;

  CountryList(this.country);

  factory CountryList.fromJson(Map<String, dynamic> countryList) =>
      _$CountryListFromJson(countryList);
  Map<String, dynamic> toJson() => _$CountryListToJson(this);

  @override
  String toString() => 'CountryList(country: $country)';
}
