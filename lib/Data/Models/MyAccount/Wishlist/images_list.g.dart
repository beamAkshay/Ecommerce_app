// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageList _$ImageListFromJson(Map<String, dynamic> json) => ImageList(
      filename: json['filename'] as String?,
      alt: json['alt'] as String?,
      caption: json['caption'] as String?,
      primary: json['primary'] as bool?,
    );

Map<String, dynamic> _$ImageListToJson(ImageList instance) => <String, dynamic>{
      'filename': instance.filename,
      'alt': instance.alt,
      'caption': instance.caption,
      'primary': instance.primary,
    };
