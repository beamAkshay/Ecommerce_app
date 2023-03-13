import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class ProductDescription extends StatelessWidget {
  const ProductDescription({Key? key, this.descriptionData}) : super(key: key);

  final String? descriptionData;

  @override
  Widget build(BuildContext context) {
    var contentBase64 =
        base64Encode(const Utf8Encoder().convert("""<!DOCTYPE html>
    <html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
      <body style='"margin: 0; padding: 0;'>
        <div>
          $descriptionData
        </div>
      </body>
    </html>"""));
    return WebView(
      // ignore: prefer_collection_literals
      // gestureRecognizers: Set()
      //   ..add(Factory<VerticalDragGestureRecognizer>(
      //       () => VerticalDragGestureRecognizer())),
      initialUrl: 'data:text/html;base64,$contentBase64',
    );
  }
}
