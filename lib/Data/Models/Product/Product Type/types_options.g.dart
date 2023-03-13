// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypesOptions _$TypesOptionsFromJson(Map<String, dynamic> json) => TypesOptions(
      json['id'] as int?,
      json['type_id'] as int?,
      json['sequence'] as int?,
      json['name'] as String?,
      json['type'] as String?,
      json['required'] as int?,
      (json['option_values'] as List<dynamic>?)
          ?.map((e) => OptionValues.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypesOptionsToJson(TypesOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type_id': instance.typeId,
      'sequence': instance.sequence,
      'name': instance.name,
      'type': instance.type,
      'required': instance.required,
      'option_values': instance.optionValues,
    };
