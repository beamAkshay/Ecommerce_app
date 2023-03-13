import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmiTable extends StatelessWidget {
  const EmiTable({Key? key, required this.emiTableHtml}) : super(key: key);

  final String? emiTableHtml;

  @override
  Widget build(BuildContext context) {
    var contentBase64 =
        base64Encode(const Utf8Encoder().convert("""<!DOCTYPE html>
    <html>
      <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
      <body style='"margin: 0; padding: 0;'>
        <div>
          $emiTableHtml
        </div>
      </body>
    </html>"""));
    return WebView(
      // ignore: prefer_collection_literals
      gestureRecognizers: Set()
        ..add(Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer())),
      initialUrl: 'data:text/html;base64,$contentBase64',
    );
  }
}
