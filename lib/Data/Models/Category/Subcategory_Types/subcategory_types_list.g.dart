// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_types_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubcategoryTypesList _$SubcategoryTypesListFromJson(
        Map<String, dynamic> json) =>
    SubcategoryTypesList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubcategoryTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubcategoryTypesListToJson(
        SubcategoryTypesList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
