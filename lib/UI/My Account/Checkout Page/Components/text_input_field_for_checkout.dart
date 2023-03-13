import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../size_config.dart';

class TextInputFieldForCheckout extends StatelessWidget {
  final String title;
  final bool obscureText;
  final bool isMandatory;
  final String? hintText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const TextInputFieldForCheckout(
      {Key? key,
      required this.title,
      this.hintText,
      required this.controller,
      this.inputFormatters,
      this.validator,
      this.textInputType,
      required this.isMandatory,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
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
        SizedBox(
          // height: 40.0,
          child: TextFormField(
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            keyboardType: textInputType,
            inputFormatters: inputFormatters,
            textInputAction: TextInputAction.next,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              contentPadding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
            ),
          ),
        ),
      ],
    );
  }
}
