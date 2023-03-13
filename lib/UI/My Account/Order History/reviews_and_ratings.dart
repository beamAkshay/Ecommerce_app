import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/HomePage/NavigationDrawer/Contact/Components/text_input_for_contact_page.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../constant/constant.dart';
import 'Components/star_rating.dart';

class ReviewAndRating extends StatefulWidget {
  static String id = "ReviewAndRating_Page";
  const ReviewAndRating({Key? key}) : super(key: key);

  @override
  State<ReviewAndRating> createState() => _ReviewAndRatingState();
}

class _ReviewAndRatingState extends State<ReviewAndRating> {
  double rating = 0;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  bool expanded1 = false;
  bool expanded2 = false;
  bool expanded3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BuildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Reviews & Ratings",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(25.0),
                        color: kDefaultHeaderFontColor)),
                const Divider(
                  color: kDefaultBorderColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //product and Product Info
                SizedBox(
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(100.0),
                        width: getProportionateScreenWidth(110.0),
                        child: const Image(
                          image: AssetImage(
                              "assets/BestSellerImages/macbook.jpeg"),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(15.0),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "13-inch MacBook Air: Apple M1 chip with 8-core CPU and 7-core GPU, 256GB - Space Grey",
                              // overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  height: 1.5,
                                  fontSize: getProportionateScreenWidth(15.0)),
                            ),

                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),
                            //Price Tag
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₹ "  "92900",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(15.0)),
                                ),
                                Text(
                                  ".00",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(10.0),
                                      color: Colors.grey[400]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //Delivered
                            Text(
                              "Delivered",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(15.0),
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //Rate Your Delivery
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rate your delivery experience",
                      style: TextStyle(
                          color: const Color(0xFF333339),
                          fontSize: getProportionateScreenWidth(20.0)),
                    ),

                    StarRating(
                      rating: rating,
                      onRatingChanged: (rating) =>
                          setState(() => this.rating = rating),
                      color: const Color(0xFF70BF44),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(25.0),
                    ),
                    //What went Well
                    Text(
                      "What went well?",
                      style: TextStyle(
                          color: const Color(0xFF333339),
                          fontSize: getProportionateScreenWidth(20.0)),
                    ),

                    //Delivery Associate
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(20.0),
                          width: getProportionateScreenHeight(20.0),
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            checkColor: Colors.white,
                            activeColor: const Color(0xFF1F99CF),
                            value: isChecked1,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked1 = value!;
                                expanded1 = !expanded1;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: getProportionateScreenWidth(15.0),
                              top: getProportionateScreenWidth(8.0)),
                          child: Text(
                            'Delivery Associate',
                            style: TextStyle(
                                color: kDefaultTitleFontColor,
                                height: 1.5,
                                fontSize: getProportionateScreenWidth(16.0)),
                          ),
                        ),
                      ],
                    ),

                    // //Packaging
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(20.0),
                          width: getProportionateScreenHeight(20.0),
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            checkColor: Colors.white,
                            activeColor: const Color(0xFF1F99CF),
                            value: isChecked2,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked2 = value!;
                                expanded2 = !expanded2;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: getProportionateScreenWidth(15.0),
                              top: getProportionateScreenWidth(8.0)),
                          child: Text(
                            'Packaging',
                            style: TextStyle(
                                color: kDefaultTitleFontColor,
                                height: 1.5,
                                fontSize: getProportionateScreenWidth(16.0)),
                          ),
                        ),
                      ],
                    ),
         
                    //Other
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(20.0),
                          width: getProportionateScreenHeight(20.0),
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            checkColor: Colors.white,
                            activeColor: const Color(0xFF1F99CF),
                            value: isChecked3,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked3 = value!;
                                expanded3 = !expanded3;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: getProportionateScreenWidth(15.0),
                              top: getProportionateScreenWidth(8.0)),
                          child: Text(
                            'Other',
                            style: TextStyle(
                                color: kDefaultTitleFontColor,
                                height: 1.5,
                                fontSize: getProportionateScreenWidth(16.0)),
                          ),
                        ),
                      ],
                    ),

                    //Animated Expand for Delivery Associate
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: expanded1 ? getProportionateScreenHeight(50) : 0,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: getProportionateScreenHeight(15.0)),
                        child: Text(
                          "Tell us more about delivery associate: ",
                          style: TextStyle(
                              color: const Color(0xFF333339),
                              fontSize: getProportionateScreenWidth(15.0)),
                        ),
                      ),
                    ),


                    //Animated Expand for Packaging
                               AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: expanded2 ? getProportionateScreenHeight(50) : 0,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: getProportionateScreenHeight(15.0)),
                        child: Text(
                          "Tell us more about the packaging:",
                          style: TextStyle(
                              color: const Color(0xFF333339),
                              fontSize: getProportionateScreenWidth(15.0)),
                        ),
                      ),
                    ),

                    //Animated Expand for Other
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: expanded3 ? getProportionateScreenHeight(150) : 0,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: getProportionateScreenHeight(15.0)),
                        child: TextInputForContactPage(
                          textAlignVertical: TextAlignVertical.top,
                          height: getProportionateScreenHeight(100.0),
                          title: "Comments:",
                          hintText: "Write Comments",
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                          isMandatory: false,
                          obscureText: false,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(25.0),
                    ),

                    //Some info
                    const Divider(
                      color: kDefaultBorderColor,
                      thickness: 1,
                    ),

                    Text(
                      "Your feedback will be used to identify improvements but not responded to directly. If you need immediate assistance with an order, contact us.",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(12.0),
                        color: kDefaultTitleFontColor,
                      ),
                    ),

                    const Divider(
                      color: kDefaultBorderColor,
                      thickness: 1,
                    ),

                    LoginButton(
                        title: "Submit",
                        color: const Color(0xFF1F99CF),
                        onPress: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
