import 'package:json_annotation/json_annotation.dart';

part 'images_list.g.dart';

@JsonSerializable()
class ImageList {
  final String? filename;
  final String? alt;
  final String? caption;
  final bool? primary;

  ImageList({
    this.filename,
    this.alt,
    this.caption,
    this.primary,
  });

   factory ImageList.fromJson(Map<String, dynamic> imageList) =>
      _$ImageListFromJson(imageList);
  Map<String, dynamic> toJson() => _$ImageListToJson(this);


  

  @override
  String toString() {
    return 'ImageList(filename: $filename, alt: $alt, caption: $caption, primary: $primary)';
  }
}
