import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Country extends Equatable{
  final int id;
  final String name;
  
  @JsonKey(name: "iso_code_2")
  final String isoCode2;
  
  const Country(this.id,this.name,this.isoCode2 );

  factory Country.fromJson(Map<String, dynamic> country) =>
      _$CountryFromJson(country);
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  

  @override
  String toString() {
    return 'Country(id: $id,name: $name, isoCode2:$isoCode2 )';
  }
  
  @override
  List<Object> get props => [id,name,isoCode2];
}
