import 'package:json_annotation/json_annotation.dart';

part 'images.g.dart';

@JsonSerializable()
class Images {
  final String? filename;
  final String? alt;
  final String? caption;
  final bool? primary;

  Images(this.filename, this.alt, this.caption, this.primary);

  
  factory Images.fromJson(Map<String, dynamic> images) =>
      _$ImagesFromJson(images);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);




  @override
  String toString() {
    return 'Images(filename: $filename, alt: $alt, caption: $caption, primary: $primary)';
  }
}
