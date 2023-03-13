import 'package:flutter/material.dart';

import '../../size_config.dart';

class ButtonWithIcon extends StatelessWidget {
  final String title;
  final Function onPress;
  final double? height;
  final double? width;
  final Color color;
  final Color? onPrimary;
  final Icon icon;

  const ButtonWithIcon(
      {Key? key,
      required this.title,
      required this.icon,
      this.onPrimary,
      required this.color,
      required this.onPress,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: () {
          onPress();
        },
        icon: icon,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // background
          foregroundColor: onPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ), // <-- Radius
          ), // foreground
        ),
        label: Text(
          title,
          style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
        ),
      ),
    );
  }
}
