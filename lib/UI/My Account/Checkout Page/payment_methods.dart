// import 'package:flutter/material.dart';
// import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
// import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/Components/order_details.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/confirm_order.dart';

// import '../../size_config.dart';
// import '../../constant.dart';
// import 'billing_address.dart';
// import 'Components/billing_address_container.dart';
// import 'Components/shipping_address_store_pickup_container.dart';
// import 'shipping_address.dart';

// class PaymentMethod extends StatefulWidget {
//   static String id = "PaymentMethod";
//   const PaymentMethod({Key? key}) : super(key: key);

//   @override
//   State<PaymentMethod> createState() => _PaymentMethodState();
// }

// class _PaymentMethodState extends State<PaymentMethod>
//     with SingleTickerProviderStateMixin {
//   TabController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const BuildAppBar(),
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

//                 //Payment Method
//                 SizedBox(
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //Billing Address Container
//                         GestureDetector(
//                       child: const BillingAddressContainer(),
//                       onTap: () {
//                         Navigator.pushNamed(context, BillingAddress.id);
//                       },
//                     ),


//                        //Shipping Address Container
//                     GestureDetector(child: const ShippingAddressStorePickupContainer(),onTap: (){
//                       Navigator.pushNamed(context, ShippingAddress.id);
//                     },),

//                       //Payment Method Tabbar
//                       Container(
//                         padding:
//                             EdgeInsets.all(getProportionateScreenHeight(10.0)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Payment Methods",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(20.0),
//                                   color: kDefaultTitleFontColor),
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(15.0),
//                             ),
//                             Container(
//                               height: 50,
//                               decoration: BoxDecoration(
//                                 color: Colors.grey[100],
//                                 border: const Border(
//                                   bottom: BorderSide(
//                                       width: 1, color: kDefaultBorderColor),
//                                 ),
//                               ),
//                               child: TabBar(
//                                 controller: _controller,
//                                 indicatorColor: Colors.grey,
//                                 labelColor: kDefaultTitleFontColor,
//                                 labelStyle: TextStyle(
//                                   fontSize: getProportionateScreenWidth(13.0),
//                                 ),
//                                 tabs: const [
//                                   Tab(
//                                     text: 'BillDesk',
//                                   ),
//                                   Tab(
//                                     text: 'COD',
//                                   ),
//                                   Tab(
//                                     text: 'Pine Labs V2',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Container(
//                               height: getProportionateScreenHeight(200),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: getProportionateScreenWidth(10.0),
//                                   vertical: getProportionateScreenWidth(20.0)),
//                               child: TabBarView(
//                                   controller: _controller,
//                                   children: [
//                                     //BillDesk
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "You will be directed to Billdesk to complete your payment. Once your payment is authorized, you will be directed back to our website and your order will be complete.",
//                                           style: TextStyle(
//                                               height: 1.5,
//                                               fontSize:
//                                                   getProportionateScreenWidth(
//                                                       13.0),
//                                               color: kDefaultTitleFontColor),
//                                         ),
//                                         SizedBox(
//                                           height: getProportionateScreenHeight(
//                                               10.0),
//                                         ),
//                                         LoginButton(
//                                             title: "Continue",
//                                             color: kDefaultSecondaryButtonColor,
//                                             onPress: () {}),
//                                       ],
//                                     ),

//                                     //Charge on Delivery
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         LoginButton(
//                                             title: "Continue",
//                                             color: kDefaultSecondaryButtonColor,
//                                             onPress: () {
//                                               Navigator.pushNamed(
//                                                   context, ConfirmOrder.id);
//                                             }),
//                                       ],
//                                     ),

//                                     //Pine Labs V2
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "You will be redirected to Pine Labs V2 to complete your payment. Once your payment is authorized, you will be directed back to our website and your order will be complete.",
//                                           style: TextStyle(
//                                               height: 1.5,
//                                               fontSize:
//                                                   getProportionateScreenWidth(
//                                                       13.0),
//                                               color: kDefaultTitleFontColor),
//                                         ),
//                                         SizedBox(
//                                           height: getProportionateScreenHeight(
//                                               10.0),
//                                         ),
//                                         LoginButton(
//                                             title: "Continue",
//                                             color: kDefaultSecondaryButtonColor,
//                                             onPress: () {}),
//                                       ],
//                                     ),
//                                   ]),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
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
