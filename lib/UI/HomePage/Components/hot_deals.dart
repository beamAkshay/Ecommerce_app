import 'package:flutter/material.dart';
import '../../size_config.dart';
import '../../../constant/constant.dart';
import 'price_tag.dart';

class HotDeals extends StatelessWidget {
  const HotDeals(
      {Key? key,
      required this.title,
      required this.imgPath,
      required this.price,
      this.cutPrice,
      this.discount})
      : super(key: key);

  final String title;
  final String imgPath;
  final String price;
  final String? cutPrice;
  final String? discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(400.0),
      width: getProportionateScreenWidth(320.0),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(15.0),
          vertical: getProportionateScreenHeight(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: kDefaultBorderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(
            flex: 6,
            child: Image(
              image: AssetImage(imgPath),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18.0),
                      overflow: TextOverflow.ellipsis),
                ),
                PriceTag(price: price),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹ $cutPrice",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(12.0),
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      ".00",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(8.0),
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                Text(
                  "$discount%off",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: getProportionateScreenWidth(13.0)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
