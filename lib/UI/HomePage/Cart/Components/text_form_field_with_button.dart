import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../size_config.dart';

class TextFormFieldAndButton extends StatelessWidget {
  final String buttonTitle;
  final String hintText;
  final TextEditingController? controller;
  final Function()? onPress;
  final bool? errorBorder;
  final String? Function(String?)? validator;
  const TextFormFieldAndButton(
      {Key? key,
      required this.buttonTitle,
      required this.validator,
      this.errorBorder,
      required this.hintText,
      this.controller,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      SizedBox(
        //color: Colors.white,
        width: getProportionateScreenWidth(350),
        //height: getProportionateScreenHeight(63),
        child: TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: false,
            signed: true,
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          cursorColor: Theme.of(context).colorScheme.secondary,
          decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              border: (errorBorder!)
                  ? Theme.of(context).inputDecorationTheme.errorBorder
                  : Theme.of(context).inputDecorationTheme.border,
              enabledBorder: (errorBorder!)
                  ? Theme.of(context).inputDecorationTheme.errorBorder
                  : Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedBorder: (errorBorder!)
                  ? Theme.of(context).inputDecorationTheme.errorBorder
                  : Theme.of(context).inputDecorationTheme.focusedBorder),
        ),
      ),
      Positioned(
        right: 0,
        child: SizedBox(
            width: getProportionateScreenWidth(80),
            height: 39,
            child: ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).colorScheme.secondary, // background
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0)), // <-- Radius
                ), // foreground
              ),
              child: Text(
                buttonTitle,
                style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
              ),
            )),
      ),
    ]);
  }
}
