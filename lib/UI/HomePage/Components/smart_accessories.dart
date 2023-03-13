import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/HomePage/Components/outlined_button.dart';

import '../../size_config.dart';
import '../../../constant/constant.dart';

class SmartAccessories extends StatelessWidget {
  const SmartAccessories(
      {Key? key, required this.title, this.onPress, required this.imgPath})
      : super(key: key);

  final String title;
  final String imgPath;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(300.0),
      margin:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5.0)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15.0),
          vertical: getProportionateScreenHeight(15.0)),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Image(
              image: AssetImage(imgPath),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(fontSize: getProportionateScreenWidth(15.0),overflow: TextOverflow.ellipsis),
          ),
          Column(
            children: [
              const Divider(
                color: kDefaultBorderColor,
                thickness: 1,
              ),
              OutlinedButtonContainer(
                title: "Buy Now",
                //width: getProportionateScreenWidth(90.0),
                onPress: onPress,
                height: getProportionateScreenHeight(35.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
