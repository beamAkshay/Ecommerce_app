
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TextFile extends StatefulWidget {
  static String id = "TextFile";
  const TextFile({Key? key}) : super(key: key);

  @override
  State<TextFile> createState() => _TextFileState();
}

class _TextFileState extends State<TextFile> {


  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://shop.unicornstore.in/contact',
      ),
    );
  }
}
