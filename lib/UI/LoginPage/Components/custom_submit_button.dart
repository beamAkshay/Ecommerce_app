import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final Function onPress;
  final double? height;
  final double? width;
  final Color color;
  final Color? onPrimary;

  const LoginButton(
      {Key? key,
      required this.title,
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
      child: ElevatedButton(
        onPressed: () {
          onPress();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: color, foregroundColor: onPrimary),
        child: Text(
          title,
        ),
      ),
    );
  }
}
