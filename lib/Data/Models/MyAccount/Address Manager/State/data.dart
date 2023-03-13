import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class StateData extends Equatable{
  final int id;
  @JsonKey(name: "country_id")
  final int countryId;
  final String name;


  const StateData(this.id, this.countryId,  this.name);

  factory StateData.fromJson(Map<String, dynamic> country) =>
      _$StateDataFromJson(country);
  Map<String, dynamic> toJson() => _$StateDataToJson(this);

    @override
  List<Object> get props => [id,countryId,name];

  @override
  String toString() {
    return 'StateData(id: $id, countryId: $countryId, name: $name)';
  }
}
