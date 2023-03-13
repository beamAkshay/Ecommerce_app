// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
// import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/billing_address.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/Components/order_details.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/payment_methods.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/shipping_address.dart';

// import '../../size_config.dart';
// import '../../constant.dart';
// import 'Components/billing_address_container.dart';
// import 'Components/payment_method_container.dart';
// import 'Components/shipping_address_store_pickup_container.dart';

// class ConfirmOrder extends StatelessWidget {
//   static String id = "Confirm_Order";
//   const ConfirmOrder({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BuildAppBar(),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Checkout",
//                     style: TextStyle(
//                         fontSize: getProportionateScreenWidth(20.0),
//                         color: kDefaultHeaderFontColor)),
//                 const Divider(
//                   color: kDefaultBorderColor,
//                   thickness: 1,
//                 ),
//                 SizedBox(
//                   height: getProportionateScreenHeight(15.0),
//                 ),

//                 //Confirm order
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //Billing Address Container
//                     GestureDetector(
//                       child: const BillingAddressContainer(),
//                       onTap: () {
//                         Navigator.pushNamed(context, BillingAddress.id);
//                       },
//                     ),

//                     //Shipping Address Container
//                     GestureDetector(child: const ShippingAddressStorePickupContainer(),onTap: (){
//                       Navigator.pushNamed(context, ShippingAddress.id);
//                     },),

//                     //PaymentMethodContainer
//                     GestureDetector(child: const PaymentMethodContainer(),onTap: (){
//                       Navigator.pushNamed(context, PaymentMethod.id);
//                     },),

//                     Container(
//                       padding:
//                           EdgeInsets.all(getProportionateScreenHeight(10.0)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Confirm Order",
//                             style: TextStyle(
//                                 fontSize: getProportionateScreenWidth(20.0),
//                                 color: kDefaultTitleFontColor),
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(15.0),
//                           ),
//                           RichText(
//                             text: TextSpan(
//                               text: 'I have read and accept the',
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(15.0),
//                                   height: 1.5,
//                                   color: kDefaultTitleFontColor),
//                               children: <TextSpan>[
//                                 TextSpan(
//                                     text: ' Terms & Conditions',
//                                     style: TextStyle(
//                                         fontSize:
//                                             getProportionateScreenWidth(15.0),
//                                         color: Colors.green),
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {}),
//                                 TextSpan(
//                                   text: " on sale.",
//                                   style: TextStyle(
//                                       fontSize:
//                                           getProportionateScreenWidth(15.0),
//                                       height: 1.5,
//                                       color: kDefaultTitleFontColor),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(10.0),
//                           ),
//                           Row(
//                             children: [
//                                    TextButton.icon(
//                                   onPressed: () {
//                                     Navigator.pushNamed(context, PaymentMethod.id);
//                                   },
//                                   icon: Icon(
//                                     Icons.arrow_back_ios_rounded,
//                                     size: getProportionateScreenHeight(20.0),
//                                     color: Colors.green,
//                                   ),
//                                   label: Text(
//                                     "Back",
//                                     style: TextStyle(
//                                         fontSize:
//                                             getProportionateScreenWidth(15.0),
//                                         color: Colors.green),
//                                   ),
//                                 ),
//                               const  Spacer(),
//                               LoginButton(
//                                   title: "Place Order",
//                                   color: kDefaultSecondaryButtonColor,
//                                   onPress: () {}),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 //Order Details
//                 const OrderDetails(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
