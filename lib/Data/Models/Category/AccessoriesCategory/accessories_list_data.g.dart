// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessories_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessoriesListData _$AccessoriesListDataFromJson(Map<String, dynamic> json) =>
    AccessoriesListData(
      json['data'] == null
          ? null
          : AccessoriesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessoriesListDataToJson(
        AccessoriesListData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
