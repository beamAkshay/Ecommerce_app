

import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../size_config.dart';

class TextFormFieldInput extends StatelessWidget {

  final bool obscureText;
  final bool isMandatory;
  final String? hintText;
  final String Function(String?)? onChanged;
  final TextEditingController? textEditingController;
  const TextFormFieldInput(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.textEditingController,
      required this.isMandatory,
      required this.obscureText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
            onChanged: onChanged,
            obscureText: obscureText,
            cursorColor: Colors.black,
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: kDefaultBorderColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF1F99CF), width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          );
  }
}