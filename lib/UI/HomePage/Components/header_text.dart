import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../constant/constant.dart';

class HeaderText extends StatelessWidget {
  final String header;

  const HeaderText({
    Key? key,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15.0)),
      child: Text(header,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(25.0),
              color: kDefaultHeaderFontColor)),
    );
  }
}
