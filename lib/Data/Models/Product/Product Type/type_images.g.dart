// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeImages _$TypeImagesFromJson(Map<String, dynamic> json) => TypeImages(
      json['filename'] as String?,
      json['alt'] as String?,
      json['caption'] as String?,
      json['primary'] as bool?,
    );

Map<String, dynamic> _$TypeImagesToJson(TypeImages instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'alt': instance.alt,
      'caption': instance.caption,
      'primary': instance.primary,
    };
