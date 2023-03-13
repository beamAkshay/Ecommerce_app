import 'package:flutter/material.dart';
import '../../../../size_config.dart';
import '../../../../../constant/constant.dart';

class TextInputForContactPage extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool obscureText;
  final double? height;
  final bool isMandatory;
  final TextAlignVertical? textAlignVertical;
  final String? hintText;

  const TextInputForContactPage(
      {Key? key,
      required this.title,
      required this.isMandatory,
      this.keyboardType,
      this.maxLines,
      this.height,
      this.hintText,
      this.textAlignVertical,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16.0),
                  color: kDefaultTitleFontColor),
            ),
            isMandatory
                ? const Positioned(
                    right: -7,
                    top: -4,
                    child: Text("*"),
                  )
                : Container(),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(5.0),
        ),
        Container(
          height: height,
          color: const Color(0xFFEEEEEE),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.top,
            keyboardType: keyboardType,
            expands: true,
            minLines: null,
            maxLines: null,
            obscureText: obscureText,
          
            cursorColor: const Color(0xFF454545),
            style: TextStyle(
                color: const Color(0xFF454545),
                fontSize: getProportionateScreenWidth(15.0)),
            decoration: InputDecoration(
              hintText:hintText ,
              hintStyle: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
              contentPadding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kDefaultBorderColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1F99CF), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(3.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
