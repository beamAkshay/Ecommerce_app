// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateList _$StateListFromJson(Map<String, dynamic> json) => StateList(
      (json['data'] as List<dynamic>)
          .map((e) => StateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StateListToJson(StateList instance) => <String, dynamic>{
      'data': instance.state,
    };
