import 'package:flutter/material.dart';

SnackBar defaultSnackBar(
    String text, Color bgColor, Color fontColor, int duration) {
  return SnackBar(
    content: Text(
      text,
      style: TextStyle(color: fontColor, fontSize: 14.0),
    ),
    backgroundColor: bgColor,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
    duration: Duration(milliseconds: duration),
  );
}