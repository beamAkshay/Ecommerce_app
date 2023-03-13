// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCategoryList _$SubCategoryListFromJson(Map<String, dynamic> json) =>
    SubCategoryList(
      data: json['data'] == null
          ? null
          : SubcategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubCategoryListToJson(SubCategoryList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
