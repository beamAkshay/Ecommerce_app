// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      json['filename'] as String?,
      json['alt'] as String?,
      json['caption'] as String?,
      json['primary'] as bool?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'filename': instance.filename,
      'alt': instance.alt,
      'caption': instance.caption,
      'primary': instance.primary,
    };
