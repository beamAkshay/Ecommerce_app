import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../constant/constant.dart';


class OutlinedButtonContainer extends StatelessWidget {

  final String title;
  final double? width;
  final double? height;
  final Function? onPress;

  const OutlinedButtonContainer({
    Key? key,required this.title, this.height, this.width,this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width:width,
      height: height,
      child: OutlinedButton(
          onPressed: () {
            onPress!();
          },
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
              return const BorderSide(
                  color: kDefaultOutlineButtonColor, width: 1);
            }),
          ),
          child: Text(
            title,
            style:  TextStyle(color: kDefaultOutlineButtonColor,fontSize: getProportionateScreenWidth(14.0)),
          ),
        
      ),
    );
  }
}
