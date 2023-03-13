import 'package:flutter/material.dart';

import '../../size_config.dart';

class ButtonWithLogo extends StatelessWidget {
  final String title;
  final String imageSrc;
  final Function onPress;
  final double? width;
  final Color? color;
  const ButtonWithLogo(
      {Key? key,
      required this.title,
      required this.imageSrc,
      required this.onPress,
      this.color,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: () {
          onPress();
        },
        icon: Image(
          image: AssetImage(imageSrc),
          width: getProportionateScreenWidth(25.0),
          height: getProportionateScreenHeight(25.0),
          color: color,
        ),
        label: Text(
          title,
          style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
        ),
        // style: ElevatedButton.styleFrom(
        //   primary: const Color(0xFF1F99CF), // background
        //   onPrimary: Colors.white,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(5.0),
        //     ), // <-- Radius
        //   ), // foreground
        // ),
      ),
    );
  }
}
