import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/size_config.dart';
import 'package:unicorn_store/constant/constant.dart';

class ParagraphContents extends StatelessWidget {
  final String paragraph;
  final TextAlign? textAlign;
  const ParagraphContents({Key? key, required this.paragraph,this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      paragraph,
      textAlign:textAlign,
      style: TextStyle(
          height: 1.5,
          fontSize: getProportionateScreenWidth(15.0),
          color: kDefaultParagraphTextFontColor),
    );
  }
}
