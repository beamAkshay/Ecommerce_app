import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../../../constant/constant.dart';


class ThirdHeaderText extends StatelessWidget {

final String thirdHeader;

  const ThirdHeaderText({ Key? key,required this.thirdHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(thirdHeader,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(17.0),
            color: kDefaultHeaderFontColor));
  }
}