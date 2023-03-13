// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';


  part 'type_image.g.dart';

@HiveType(typeId: 1)
class TypeImage extends HiveObject{
  @HiveField(0)
  final String? alt;
  @HiveField(1)
  final String? caption;
  @HiveField(2)
  final bool? primary;
  @HiveField(3)
  final String? filename;
  

  TypeImage({
    this.alt,
    this.caption,
    this.primary,
    this.filename,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'alt': alt,
      'caption': caption,
      'primary': primary,
      'filename': filename,
    };
  }

  factory TypeImage.fromJson(Map<String, dynamic> map) {
    return TypeImage(
      alt: map['alt'] != null ? map['alt'] as String : null,
      caption: map['caption'] != null ? map['caption'] as String : null,
      primary: map['primary'] != null ? map['primary'] as bool : null,
      filename: map['filename'] != null ? map['filename'] as String : null,
    );
  }

  @override
  String toString() {
    return 'TypeImage(alt: $alt, caption: $caption, primary: $primary, filename: $filename)';
  }
}
