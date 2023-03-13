// import 'package:flutter/material.dart';
// import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
// import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/Components/order_details.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/shipping_address.dart';

// import '../../size_config.dart';
// import '../../constant.dart';
// import 'Components/text_input_field_for_checkout.dart';

// class BillingAddress extends StatefulWidget {
//   static String id = "BillingAddress";

//   const BillingAddress({Key? key}) : super(key: key);

//   @override
//   State<BillingAddress> createState() => _BillingAddressState();
// }

// class _BillingAddressState extends State<BillingAddress> {
//   String? dropdownValueForCountry;

//   String? dropdownValueForState;

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

//                 //Billing Address
//                 Container(
//                   color: const Color(0xFFFBFBFB),
//                   padding: EdgeInsets.all(getProportionateScreenHeight(10.0)),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Billing Address",
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(20.0),
//                             color: kDefaultTitleFontColor),
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //First Name
//                       const TextInputFieldForCheckout(
//                         title: "First Name",
//                         isMandatory: true,
//                         obscureText: false,
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Last Name
//                       const TextInputFieldForCheckout(
//                         title: "Last Name",
//                         isMandatory: true,
//                         obscureText: false,
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Email
//                       const TextInputFieldForCheckout(
//                         title: "E-mail",
//                         isMandatory: true,
//                         obscureText: false,
//                       ),

//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Phone No
//                       const TextInputFieldForCheckout(
//                         title: "Phone No.",
//                         isMandatory: true,
//                         obscureText: false,
//                       ),

//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Address 1
//                       const TextInputFieldForCheckout(
//                         title: "Address 1",
//                         isMandatory: true,
//                         obscureText: false,
//                       ),

//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Address 2
//                       const TextInputFieldForCheckout(
//                         title: "Address 2",
//                         isMandatory: false,
//                         obscureText: false,
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //City
//                       const TextInputFieldForCheckout(
//                         title: "City",
//                         isMandatory: true,
//                         obscureText: false,
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Zip
//                       const TextInputFieldForCheckout(
//                         title: "Post Code",
//                         isMandatory: true,
//                         obscureText: false,
//                       ),
//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Country
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               Text(
//                                 "Country",
//                                 style: TextStyle(
//                                     fontSize:
//                                         getProportionateScreenWidth(15.0)),
//                               ),
//                               const Positioned(
//                                 right: -7,
//                                 top: -4,
//                                 child: Text("*"),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(5.0),
//                           ),
//                           Container(
//                             height: getProportionateScreenHeight(35.0),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(3.0)),
//                                 border: Border.all(
//                                     width: 1, color: kDefaultBorderColor)),
//                             child: DropdownButtonHideUnderline(
//                               child: ButtonTheme(
//                                 alignedDropdown: true,
//                                 child: Theme(
//                                   data: Theme.of(context).copyWith(
//                                     canvasColor: const Color(0xFFEEEEEE),
//                                   ),
//                                   child: DropdownButton<String>(
//                                     value: dropdownValueForCountry,
//                                     isDense: true,
//                                     icon: const Icon(Icons.arrow_drop_down),
//                                     elevation: 0,
//                                     style: TextStyle(
//                                         color: const Color(0xFF454545),
//                                         fontSize:
//                                             getProportionateScreenWidth(15.0)),
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         dropdownValueForCountry = newValue!;
//                                       });
//                                     },
//                                     hint: Text("Select Country",
//                                         style: TextStyle(
//                                             color: const Color(0xFF454545),
//                                             fontSize:
//                                                 getProportionateScreenWidth(
//                                                     15.0))),
//                                     isExpanded: true,
//                                     items: <String>[
//                                       'India',
//                                       'Pakistan',
//                                       'Germany',
//                                     ].map<DropdownMenuItem<String>>(
//                                         (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //State
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               Text(
//                                 "State",
//                                 style: TextStyle(
//                                     fontSize:
//                                         getProportionateScreenWidth(15.0)),
//                               ),
//                               const Positioned(
//                                 right: -7,
//                                 top: -4,
//                                 child: Text("*"),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(5.0),
//                           ),
//                           Container(
//                             height: getProportionateScreenHeight(35),
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(3.0)),
//                                 border: Border.all(
//                                     width: 1, color: kDefaultBorderColor)),
//                             child: DropdownButtonHideUnderline(
//                               child: ButtonTheme(
//                                 alignedDropdown: true,
//                                 child: Theme(
//                                   data: Theme.of(context).copyWith(
//                                     canvasColor: const Color(0xFFEEEEEE),
//                                   ),
//                                   child: DropdownButton<String>(
//                                     isDense: true,
//                                     value: dropdownValueForState,
//                                     icon: const Icon(Icons.arrow_drop_down),
//                                     elevation: 0,
//                                     style: TextStyle(
//                                         color: const Color(0xFF454545),
//                                         fontSize:
//                                             getProportionateScreenWidth(15.0)),
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         dropdownValueForState = newValue!;
//                                       });
//                                     },
//                                     hint: Text("Select state",
//                                         style: TextStyle(
//                                             color: const Color(0xFF454545),
//                                             fontSize:
//                                                 getProportionateScreenWidth(
//                                                     15.0))),
//                                     isExpanded: true,
//                                     items: <String>[
//                                       'Maharastra',
//                                       'Goa',
//                                       'Gujrat',
//                                     ].map<DropdownMenuItem<String>>(
//                                         (String value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value,
//                                         child: Text(value),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),

//                       SizedBox(
//                         height: getProportionateScreenHeight(15.0),
//                       ),

//                       //Submit and Close Button

//                       Align(
//                         alignment: Alignment.topRight,
//                         child: LoginButton(
//                             title: "Continue",
//                             color: kDefaultSecondaryButtonColor,
//                             onPress: () {
//                               Navigator.pushNamed(context, ShippingAddress.id);
//                             }),
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
