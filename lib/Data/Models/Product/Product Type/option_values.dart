import 'package:json_annotation/json_annotation.dart';
part 'option_values.g.dart';

@JsonSerializable()
class OptionValues {
  final int? id;

  @JsonKey(name: "option_id")
  final int? optionId;
  final String? name;
  final String? value;
  final String? color;
  final int? sequence;
  final int? limit;

  OptionValues(this.id, this.optionId, this.name, this.value, this.color,
      this.sequence, this.limit);

  
  factory OptionValues.fromJson(Map<String, dynamic> optionValues) =>
      _$OptionValuesFromJson(optionValues);
  Map<String, dynamic> toJson() => _$OptionValuesToJson(this);

  @override
  String toString() {
    return 'OptionValues(id: $id, optionId: $optionId, name: $name, value: $value, color: $color, sequence: $sequence, limit: $limit)';
  }
}
