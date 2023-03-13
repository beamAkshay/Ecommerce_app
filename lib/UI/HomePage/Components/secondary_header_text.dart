import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../../../constant/constant.dart';

class SecondaryHeaderText extends StatelessWidget {
  final String secondaryHeader;

  const SecondaryHeaderText({Key? key, required this.secondaryHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(secondaryHeader,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(20.0),
            color: kDefaultHeaderFontColor));
  }
}
