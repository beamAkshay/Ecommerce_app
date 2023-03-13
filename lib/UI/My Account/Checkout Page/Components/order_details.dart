// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:unicorn_store/UI/HomePage/Components/price_tag.dart';
// import 'package:unicorn_store/UI/HomePage/Components/secondary_header_text.dart';

// import '../../../size_config.dart';
// import '../../../../constant/constant.dart';

// class OrderDetails extends StatelessWidget {
//   const OrderDetails({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         border: Border.all(color: kDefaultBorderColor),
//       ),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(color: kDefaultBorderColor),
//               ),
//             ),
//             child: Text(
//               "Order Details",
//               style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
//             ),
//           ),

//           //Product List
//           ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   return Container(
//                     height: getProportionateScreenHeight(300),
//                     padding: EdgeInsets.only(
//                         top: getProportionateScreenWidth(15.0),
//                         left: getProportionateScreenWidth(15.0),
//                         right: getProportionateScreenWidth(15.0)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: getProportionateScreenHeight(100.0),
//                                 width: getProportionateScreenWidth(100.0),
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: kDefaultBorderColor)),
//                                 child: const Image(
//                                   fit: BoxFit.fill,
//                                   image: AssetImage(
//                                       "assets/BestSellerImages/iphone11-red.jpeg"),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: getProportionateScreenWidth(25.0),
//                               ),
//                               Flexible(
//                                 child: Text(
//                                   "iPhone XR Red 128GB",
//                                   // overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       fontSize:
//                                           getProportionateScreenWidth(15.0)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         //Price Tag
//                         Column(
//                           children: [
//                             Text(
//                               "Price",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(5.0),
//                             ),
//                             const PriceTag(
//                               price: "52900",
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(20.0),
//                         ),

//                         //Quantity
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Qty :",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                             Text(
//                               "1",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(20.0),
//                         ),

//                         //Total
//                         Column(
//                           children: [
//                             Text(
//                               "Total",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(5.0),
//                             ),
//                             const PriceTag(
//                               price: "44,900",
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   return Container(
//                     height: getProportionateScreenHeight(330),
//                     padding: EdgeInsets.only(
//                         top: getProportionateScreenWidth(15.0),
//                         bottom: getProportionateScreenWidth(15.0),
//                         left: getProportionateScreenWidth(15.0),
//                         right: getProportionateScreenWidth(15.0)),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Divider(
//                           color: kDefaultBorderColor,
//                           thickness: 1,
//                         ),

//                         Expanded(
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: getProportionateScreenHeight(100.0),
//                                 width: getProportionateScreenWidth(100.0),
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: kDefaultBorderColor)),
//                                 child: const Image(
//                                   fit: BoxFit.fill,
//                                   image: AssetImage(
//                                       "assets/BestSellerImages/iphone11-red.jpeg"),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: getProportionateScreenWidth(25.0),
//                               ),
//                               Flexible(
//                                 child: Text(
//                                   "iPhone XR Red 128GB",
//                                   // overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                       fontSize:
//                                           getProportionateScreenWidth(15.0)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),

//                         //Price Tag
//                         Column(
//                           children: [
//                             Text(
//                               "Price",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(5.0),
//                             ),
//                             const PriceTag(
//                               price: "52900",
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(20.0),
//                         ),

//                         //Quantity
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Qty :",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                             Text(
//                               "1",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: getProportionateScreenHeight(20.0),
//                         ),

//                         //Total
//                         Column(
//                           children: [
//                             Text(
//                               "Total",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0)),
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(5.0),
//                             ),
//                             const PriceTag(
//                               price: "44,900",
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               }),

//           //Grand Total
//           Container(
//             padding: EdgeInsets.only(
//                 left: getProportionateScreenHeight(15.0),
//                 right: getProportionateScreenHeight(15.0),
//                 bottom: getProportionateScreenHeight(15.0)),
//             child: Column(
//               children: [
//                 const Divider(
//                   color: kDefaultBorderColor,
//                   thickness: 3,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     SecondaryHeaderText(secondaryHeader: "Grand Total :"),
//                     Spacer(),
//                     PriceTag(
//                       price: "1,00,700",
//                       fontSize: 18.0,
//                       priceSuffixFontSize: 15.0,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(5.0),
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
//                     "(*Inclusive of all taxes)",
//                     style: TextStyle(
//                         fontSize: getProportionateScreenWidth(12.0),
//                         color: kDefaultTitleFontColor),
//                   ),
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(15.0),
//                 ),
//                 const Divider(
//                   color: kDefaultBorderColor,
//                   thickness: 1,
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(5.0),
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     text: 'By submitting your order, you agree to the',
//                     style: TextStyle(
//                         fontSize: getProportionateScreenWidth(15.0),
//                         height: 1.5,
//                         color: kDefaultTitleFontColor),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: ' Terms & Conditions',
//                           style: TextStyle(
//                               fontSize: getProportionateScreenWidth(15.0),
//                               color: Colors.green),
//                           recognizer: TapGestureRecognizer()..onTap = () {}),
//                       TextSpan(
//                         text: ' and ',
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(15.0),
//                             color: kDefaultTitleFontColor),
//                       ),
//                       TextSpan(
//                           text: 'Privacy Policy',
//                           style: TextStyle(
//                               fontSize: getProportionateScreenWidth(15.0),
//                               color: Colors.green),
//                           recognizer: TapGestureRecognizer()..onTap = () {}),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(10.0),
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(
//                       Icons.info_sharp,
//                       size: getProportionateScreenHeight(20.0),
//                     ),
//                     SizedBox(
//                       width: getProportionateScreenWidth(5.0),
//                     ),
//                     Text(
//                       "Need any help?",
//                       style: TextStyle(
//                           fontSize: getProportionateScreenWidth(15.0)),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(10.0),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "Speak to Our e-commerce specialist :",
//                       style: TextStyle(
//                           fontSize: getProportionateScreenWidth(12.0)),
//                     ),
//                     SizedBox(
//                       width: getProportionateScreenWidth(5),
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.phone_sharp,
//                           size: getProportionateScreenWidth(13.0),
//                           color: Colors.green,
//                         ),
//                         const Text(
//                           "1800267788",
//                           style: TextStyle(fontSize: 12, color: Colors.green),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(10.0),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
