// import 'package:flutter/material.dart';
// import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
// import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/Components/order_details.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/payment_methods.dart';

// import '../../size_config.dart';
// import '../../constant.dart';
// import 'billing_address.dart';
// import 'Components/billing_address_container.dart';
// import 'Components/text_input_field_for_checkout.dart';

// enum ShippingAddressEnum { billAddress, nearestUnicornStoreAddress, newAddress }

// class ShippingAddress extends StatefulWidget {
//   static String id = "ShippingAdress_Screen";
//   const ShippingAddress({Key? key}) : super(key: key);

//   @override
//   State<ShippingAddress> createState() => _ShippingAddressState();
// }

// class _ShippingAddressState extends State<ShippingAddress> {
//   bool expanded = false;

//   bool expanded1 = false;

//   String? dropdownValueForCountry;
//   String? dropdownValueForState;

//   String? radioBtnValue;

//   ShippingAddressEnum? _shippingAddressDetails =
//       ShippingAddressEnum.billAddress;

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

//                 //Shipping Address
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

//                       Container(
//                         padding:
//                             EdgeInsets.all(getProportionateScreenHeight(10.0)),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Shipping Address / Store Pickup",
//                               style: TextStyle(
//                                   fontSize: getProportionateScreenWidth(20.0),
//                                   color: kDefaultTitleFontColor),
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(15.0),
//                             ),

//                             //Ship to billing address
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: getProportionateScreenHeight(20.0),
//                                   width: getProportionateScreenHeight(20.0),
//                                   child: Radio<ShippingAddressEnum>(
//                                     value: ShippingAddressEnum.billAddress,
//                                     groupValue: _shippingAddressDetails,
//                                     onChanged: (ShippingAddressEnum? value) {
//                                       setState(() {
//                                         _shippingAddressDetails = value;
//                                         expanded = false;
//                                         expanded1 = false;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: getProportionateScreenWidth(10.0),
//                                 ),
//                                 Text(
//                                   'Ship to billing address',
//                                   style: TextStyle(
//                                       fontSize:
//                                           getProportionateScreenWidth(15.0),
//                                       color: const Color(0xFF444444)),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(15.0),
//                             ),

//                             //Ship to your nearest Unicorn store
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: getProportionateScreenHeight(20.0),
//                                   width: getProportionateScreenHeight(20.0),
//                                   child: Radio<ShippingAddressEnum>(
//                                     value: ShippingAddressEnum
//                                         .nearestUnicornStoreAddress,
//                                     groupValue: _shippingAddressDetails,
//                                     onChanged: (ShippingAddressEnum? value) {
//                                       setState(() {
//                                         _shippingAddressDetails = value;

//                                       //  print(value);

//                                         expanded = !expanded;
//                                         expanded1 = false;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: getProportionateScreenWidth(10.0),
//                                 ),
//                                 Text(
//                                   'Ship to your nearest Unicorn store',
//                                   style: TextStyle(
//                                       fontSize:
//                                           getProportionateScreenWidth(15.0),
//                                       color: const Color(0xFF444444)),
//                                 ),
//                               ],
//                             ),

//                             AnimatedContainer(
//                               duration: const Duration(milliseconds: 200),
//                               height: expanded
//                                   ? getProportionateScreenHeight(60)
//                                   : 0,
//                               child: expanded
//                                   ? Container(
//                                       margin: EdgeInsets.only(
//                                           top: getProportionateScreenHeight(
//                                               10.0)),
//                                       height:
//                                           getProportionateScreenHeight(35.0),
//                                       child: TextFormField(
//                                         cursorColor: Colors.black,
//                                         decoration: InputDecoration(
//                                           hintText: "Search Store..",
//                                           contentPadding: EdgeInsets.all(
//                                               getProportionateScreenWidth(
//                                                   10.0)),
//                                           border: const OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(5.0))),
//                                           enabledBorder:
//                                               const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: kDefaultBorderColor,
//                                                 width: 1.0),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(5.0)),
//                                           ),
//                                           focusedBorder:
//                                               const OutlineInputBorder(
//                                             borderSide: BorderSide(
//                                                 color: Color(0xFF1F99CF),
//                                                 width: 1.0),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(5.0)),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   : Container(),
//                             ),

//                             SizedBox(
//                               height: getProportionateScreenHeight(15.0),
//                             ),

//                             // Enter a new address
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: getProportionateScreenHeight(20.0),
//                                   width: getProportionateScreenHeight(20.0),
//                                   child: Radio<ShippingAddressEnum>(
//                                     value: ShippingAddressEnum.newAddress,
//                                     groupValue: _shippingAddressDetails,
//                                     onChanged: (ShippingAddressEnum? value) {
//                                       setState(() {
//                                         _shippingAddressDetails = value;
//                                         expanded1 = !expanded1;
//                                         expanded = false;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: getProportionateScreenWidth(10.0),
//                                 ),
//                                 Text(
//                                   'Enter a new address',
//                                   style: TextStyle(
//                                       fontSize:
//                                           getProportionateScreenWidth(15.0),
//                                       color: const Color(0xFF444444)),
//                                 ),
//                               ],
//                             ),
//                             AnimatedContainer(
//                               duration: const Duration(milliseconds: 200),
//                               height: expanded1 ? getProportionateScreenHeight(780) : 0,
//                               child: Container(
//                                 alignment: Alignment.topLeft,
//                                 margin: EdgeInsets.only(
//                                     top: getProportionateScreenHeight(10.0)),
//                                 padding: EdgeInsets.all(
//                                     getProportionateScreenHeight(15.0)),
//                                 child: ListView(
//                                   physics: const NeverScrollableScrollPhysics(),
//                                   children: [
//                                     //First Name
//                                     const TextInputFieldForCheckout(
//                                       title: "First Name",
//                                       isMandatory: true,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //Last Name
//                                     const TextInputFieldForCheckout(
//                                       title: "Last Name",
//                                       isMandatory: true,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //Email
//                                     const TextInputFieldForCheckout(
//                                       title: "E-mail",
//                                       isMandatory: true,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //Phone No
//                                     const TextInputFieldForCheckout(
//                                       title: "Phone No.",
//                                       isMandatory: true,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //Address 1
//                                     const TextInputFieldForCheckout(
//                                       title: "Address 1",
//                                       isMandatory: true,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //Address 2
//                                     const TextInputFieldForCheckout(
//                                       title: "Address 2",
//                                       isMandatory: false,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //City
//                                     const TextInputFieldForCheckout(
//                                       title: "City",
//                                       isMandatory: true,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //Zip
//                                     const TextInputFieldForCheckout(
//                                       title: "Post Code",
//                                       isMandatory: true,
//                                       obscureText: false,
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //Country
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Stack(
//                                           clipBehavior: Clip.none,
//                                           children: [
//                                             Text(
//                                               "Country",
//                                               style: TextStyle(
//                                                   fontSize:
//                                                       getProportionateScreenWidth(
//                                                           15.0)),
//                                             ),
//                                             const Positioned(
//                                               right: -7,
//                                               top: -4,
//                                               child: Text("*"),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height:
//                                               getProportionateScreenHeight(5.0),
//                                         ),
//                                         Container(
//                                           height: getProportionateScreenHeight(
//                                               35.0),
//                                           width: double.infinity,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(3.0)),
//                                               border: Border.all(
//                                                   width: 1,
//                                                   color: kDefaultBorderColor)),
//                                           child: DropdownButtonHideUnderline(
//                                             child: ButtonTheme(
//                                               alignedDropdown: true,
//                                               child: Theme(
//                                                 data:
//                                                     Theme.of(context).copyWith(
//                                                   canvasColor:
//                                                       const Color(0xFFEEEEEE),
//                                                 ),
//                                                 child: DropdownButton<String>(
//                                                   value:
//                                                       dropdownValueForCountry,
//                                                   isDense: true,
//                                                   icon: const Icon(
//                                                       Icons.arrow_drop_down),
//                                                   elevation: 0,
//                                                   style: TextStyle(
//                                                       color: const Color(
//                                                           0xFF454545),
//                                                       fontSize:
//                                                           getProportionateScreenWidth(
//                                                               15.0)),
//                                                   onChanged:
//                                                       (String? newValue) {
//                                                     setState(() {
//                                                       dropdownValueForCountry =
//                                                           newValue!;
//                                                     });
//                                                   },
//                                                   hint: Text("Select Country",
//                                                       style: TextStyle(
//                                                           color: const Color(
//                                                               0xFF454545),
//                                                           fontSize:
//                                                               getProportionateScreenWidth(
//                                                                   15.0))),
//                                                   isExpanded: true,
//                                                   items: <String>[
//                                                     'India',
//                                                     'Pakistan',
//                                                     'Germany',
//                                                   ].map<
//                                                           DropdownMenuItem<
//                                                               String>>(
//                                                       (String value) {
//                                                     return DropdownMenuItem<
//                                                         String>(
//                                                       value: value,
//                                                       child: Text(value),
//                                                     );
//                                                   }).toList(),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),

//                                     //State
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Stack(
//                                           clipBehavior: Clip.none,
//                                           children: [
//                                             Text(
//                                               "State",
//                                               style: TextStyle(
//                                                   fontSize:
//                                                       getProportionateScreenWidth(
//                                                           15.0)),
//                                             ),
//                                             const Positioned(
//                                               right: -7,
//                                               top: -4,
//                                               child: Text("*"),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height:
//                                               getProportionateScreenHeight(5.0),
//                                         ),
//                                         Container(
//                                           height:
//                                               getProportionateScreenHeight(35),
//                                           width: double.infinity,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   const BorderRadius.all(
//                                                       Radius.circular(3.0)),
//                                               border: Border.all(
//                                                   width: 1,
//                                                   color: kDefaultBorderColor)),
//                                           child: DropdownButtonHideUnderline(
//                                             child: ButtonTheme(
//                                               alignedDropdown: true,
//                                               child: Theme(
//                                                 data:
//                                                     Theme.of(context).copyWith(
//                                                   canvasColor:
//                                                       const Color(0xFFEEEEEE),
//                                                 ),
//                                                 child: DropdownButton<String>(
//                                                   isDense: true,
//                                                   value: dropdownValueForState,
//                                                   icon: const Icon(
//                                                       Icons.arrow_drop_down),
//                                                   elevation: 0,
//                                                   style: TextStyle(
//                                                       color: const Color(
//                                                           0xFF454545),
//                                                       fontSize:
//                                                           getProportionateScreenWidth(
//                                                               15.0)),
//                                                   onChanged:
//                                                       (String? newValue) {
//                                                     setState(() {
//                                                       dropdownValueForState =
//                                                           newValue!;
//                                                     });
//                                                   },
//                                                   hint: Text("Select state",
//                                                       style: TextStyle(
//                                                           color: const Color(
//                                                               0xFF454545),
//                                                           fontSize:
//                                                               getProportionateScreenWidth(
//                                                                   15.0))),
//                                                   isExpanded: true,
//                                                   items: <String>[
//                                                     'Maharastra',
//                                                     'Goa',
//                                                     'Gujrat',
//                                                   ].map<
//                                                           DropdownMenuItem<
//                                                               String>>(
//                                                       (String value) {
//                                                     return DropdownMenuItem<
//                                                         String>(
//                                                       value: value,
//                                                       child: Text(value),
//                                                     );
//                                                   }).toList(),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),

//                                     SizedBox(
//                                       height:
//                                           getProportionateScreenHeight(15.0),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: getProportionateScreenHeight(10.0),
//                             ),

//                             Row(
//                               children: [
//                                 TextButton.icon(
//                                   onPressed: () {
//                                     Navigator.pushNamed(context, BillingAddress.id);
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
//                                const Spacer(),
//                                 LoginButton(
//                                     title: "Continue",
//                                     color: kDefaultSecondaryButtonColor,
//                                     onPress: () {
//                                       Navigator.pushNamed(
//                                           context, PaymentMethod.id);
//                                     }),
//                               ],
//                             ),
//                           ],
//                         ),
//                       )
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
