import 'package:flutter/material.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Order%20History/order_history_data.dart';

import '../../../size_config.dart';
import '../../../../constant/constant.dart';
import '../order_details.dart';
import 'title_and_data.dart';

class OderHistoryItem extends StatelessWidget {
  final OrderHistoryData? orderData;
  const OderHistoryItem({Key? key, this.orderData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, OrderDetails.id,
                arguments: {"productDataList": orderData!.product});
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(20.0)),
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(2.0))),
            child: Column(
              children: [
                TitleAndData(
                  title: "Order ID: ",
                  data: orderData!.order_number.toString(),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                TitleAndData(
                    title: "No Of Items: ",
                    data: orderData!.product!.length.toString()),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                TitleAndData(
                    title: "Order Date: ",
                    data: orderData!.ordered_on.toString()),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                TitleAndData(
                    title: "Total Amount: ", data: orderData!.total.toString()),
              ],
            ),
          ),
        ),
        Positioned(
            right: getProportionateScreenWidth(15.0),
            top: getProportionateScreenHeight(15.0),
            child: Container(
              width: 100,
              padding: EdgeInsets.all(getProportionateScreenWidth(2.0)),
              decoration: BoxDecoration(
                border: Border.all(color: kDefaultSecondaryButtonColor),
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Text(
                orderData!.status.toString(),
                maxLines: 1,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15.0),
                    color: kDefaultSecondaryButtonColor),
              ),
            ))
      ],
    );
  }
}
