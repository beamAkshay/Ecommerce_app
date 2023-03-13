import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history_product.dart';
import 'package:unicorn_store/UI/HomePage/Components/price_tag.dart';

import '../../../Components/image_path.dart';
import '../../../size_config.dart';
import '../../../../constant/constant.dart';
import 'title_and_data.dart';

class ItemsInsideSingleOrder extends StatelessWidget {
  final OrderHistoryProduct? orderItems;
  const ItemsInsideSingleOrder({Key? key, this.orderItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return Container(
      //height: 150,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(15.0)),
      padding: EdgeInsets.all(getProportionateScreenHeight(10.0)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kDefaultBorderColor),
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: getProportionateScreenHeight(90.0),
            width: getProportionateScreenWidth(90.0),
            imageUrl:
                "$categoryImageUrl/product/medium/${ImagePath.getPrimaryImageSrc(orderItems!.contents!.images!)}",
            placeholder: (context, url) => Container(),
            errorWidget: (context, url, error) => SizedBox(
              height: getProportionateScreenHeight(300),
              width: getProportionateScreenWidth(300),
              child: const Image(
                fit: BoxFit.fill,
                image: AssetImage(errorImageUrl),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderItems!.contents!.name.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      height: 1.5, fontSize: getProportionateScreenWidth(15.0)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                TitleAndData(
                    title: "OTY: ", data: orderItems!.quantity!.toString()),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                TitleAndData(
                  title: "Amount: ",
                  priceTag: PriceTag(
                    price: orderItems!.contents!.price.toString(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
