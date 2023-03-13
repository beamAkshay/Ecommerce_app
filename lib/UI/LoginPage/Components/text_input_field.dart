import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../size_config.dart';

class TextInputField extends StatelessWidget {
  final String? title;
  final bool obscureText;
  final bool isMandatory;
  final String? hintText;
  final TextInputType textInputType;
  final String Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  const TextInputField(
      {Key? key,
      this.title,
      this.hintText,
      this.inputFormatters,
      required this.textInputType,
      this.onChanged,
      this.validator,
      this.textEditingController,
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
              title ?? " ",
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
        TextFormField(
          inputFormatters: inputFormatters,
          validator: validator,
          onChanged: onChanged,
          keyboardType: textInputType,
          obscureText: obscureText,
          cursorColor: Theme.of(context).colorScheme.secondary,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            contentPadding: EdgeInsets.all(getProportionateScreenWidth(12.0)),
          ),
        ),
      ],
    );
  }
}
