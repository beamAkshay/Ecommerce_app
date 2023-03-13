import 'package:json_annotation/json_annotation.dart';

part 'type_images.g.dart';

@JsonSerializable()
class TypeImages {
  final String? filename;
  final String? alt;
  final String? caption;
  final bool? primary;

  TypeImages(this.filename, this.alt, this.caption, this.primary);

 
  
  factory TypeImages.fromJson(Map<String, dynamic> typesImages) =>
      _$TypeImagesFromJson(typesImages);
  Map<String, dynamic> toJson() => _$TypeImagesToJson(this);

  @override
  String toString() {
    return 'TypeImages(filename: $filename, alt: $alt, caption: $caption, primary: $primary)';
  }
}
