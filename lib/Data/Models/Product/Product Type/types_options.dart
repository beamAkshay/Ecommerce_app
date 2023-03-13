
import 'package:json_annotation/json_annotation.dart';

import 'option_values.dart';


part 'types_options.g.dart';

@JsonSerializable()
class TypesOptions {
  final int? id;

  @JsonKey(name:"type_id")
  final int? typeId;
  final int? sequence;
  final String? name;
  final String? type;
  final int? required;

  @JsonKey(name:"option_values")
  final List<OptionValues>? optionValues;

  TypesOptions(this.id, this.typeId, this.sequence, this.name, this.type, this.required, this.optionValues);
  

 
  factory TypesOptions.fromJson(Map<String, dynamic> typesOptions) =>
      _$TypesOptionsFromJson(typesOptions);
  Map<String, dynamic> toJson() => _$TypesOptionsToJson(this);




  @override
  String toString() {
    return 'TypesOptions(id: $id, typeId: $typeId, sequence: $sequence, name: $name, type: $type, required: $required, optionValues: $optionValues)';
  }
}
