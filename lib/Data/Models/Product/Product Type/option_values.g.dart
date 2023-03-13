// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionValues _$OptionValuesFromJson(Map<String, dynamic> json) => OptionValues(
      json['id'] as int?,
      json['option_id'] as int?,
      json['name'] as String?,
      json['value'] as String?,
      json['color'] as String?,
      json['sequence'] as int?,
      json['limit'] as int?,
    );

Map<String, dynamic> _$OptionValuesToJson(OptionValues instance) =>
    <String, dynamic>{
      'id': instance.id,
      'option_id': instance.optionId,
      'name': instance.name,
      'value': instance.value,
      'color': instance.color,
      'sequence': instance.sequence,
      'limit': instance.limit,
    };
