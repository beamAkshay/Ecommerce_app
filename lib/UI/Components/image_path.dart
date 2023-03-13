import 'dart:developer';

import 'package:unicorn_store/Data/Models/Product/New%20Product/type_image.dart';

class ImagePath {
  static String? getPrimaryImageSrc(List<TypeImage> images) {
    String? path;
    for (var element in images) {
      if (element.primary == true && element.primary != null) {
        path = element.filename!;
      }
    }
    log("This is image path $path");
    return path;
  }
}
