
import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/HomePage/Components/price_tag.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../../constant/constant.dart';

class HotDealsPage extends StatelessWidget {
  static String id = "HotDealsPage_Screen";
  const HotDealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                  padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
                  child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text("iPhone 11",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20.0),
                        color: kDefaultHeaderFontColor)),
              ),
              const Divider(
                color: kDefaultBorderColor,
                thickness: 1,
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
          
              //********************Product Info*************************/
          
              ListView.builder(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(160),
                            width: getProportionateScreenWidth(160.0),
                            child: const Image(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/BestSellerImages/iphone11.jpeg")),
                          ),
                          Text("iPhone 11 Black 64GB",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15.0),
                                  height: 1.5,
                                  color: kDefaultHeaderFontColor)),
                          SizedBox(
                            height: getProportionateScreenHeight(10.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Price",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(15.0),
                                      color: kDefaultTitleFontColor)),
                              SizedBox(
                                width: getProportionateScreenWidth(5.0),
                              ),
                            const  PriceTag(price: "47405"),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10.0),
                          ),
                         const PriceTag(
                            price: "49900",
                            textDecoration: TextDecoration.lineThrough,
                            color: kDefaultTitleFontColor,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10.0),
                          ),
                          Text(
                            "5% off",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(15.0),
                                color: Colors.green),
                          )
                        ],
                      ),
                    );
                  }),
            ],
                  ),
                ),
          )),
    );
  }
}
