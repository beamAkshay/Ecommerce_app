import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/HomePage/Components/price_tag.dart';

import '../../../size_config.dart';
import '../../../../constant/constant.dart';



class TitleAndData extends StatelessWidget {
  final String title;
  final String? data;
  final PriceTag? priceTag;

  const TitleAndData({Key? key, required this.title,  this.data,this.priceTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(15.0),
              color: kDefaultTitleFontColor),
        ),
        SizedBox(
          width: getProportionateScreenHeight(5.0),
        ),
        priceTag ?? Flexible(
          child: Text(
            data ?? "",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle( 
            fontSize: getProportionateScreenWidth(14.0),
                color: kDefaultHeaderFontColor),
          ),
        ),
      ],
    );
  }
}
