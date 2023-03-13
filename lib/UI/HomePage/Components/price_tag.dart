import 'package:flutter/material.dart';

import '../../size_config.dart';


class PriceTag extends StatelessWidget {

final String price;
final TextDecoration? textDecoration;
final Color? color;
final double? fontSize;
final double? priceSuffixFontSize;

  const PriceTag({
    Key? key,required this.price,this.textDecoration,this.color,this.fontSize,this.priceSuffixFontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
         "₹ $price",
         
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
          decoration: textDecoration,
              fontSize:fontSize ?? getProportionateScreenWidth(15.0),color: color),
        ),
        Text(
          ".00",
          style: TextStyle(
            decoration: textDecoration,
              fontSize:priceSuffixFontSize?? getProportionateScreenWidth(10.0),
              color:color),
        ),
      ],
    );
 
 
  }
}
