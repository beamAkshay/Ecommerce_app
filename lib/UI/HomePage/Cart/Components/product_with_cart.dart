// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:unicorn_store/Business_Logic/bloc/cart/remove/remove_cart_item_bloc.dart';
// import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
// import 'package:unicorn_store/UI/Components/default_snackbar.dart';
// import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/billing_address.dart';
// import 'package:unicorn_store/UI/size_config.dart';
// import 'package:unicorn_store/UI/HomePage/Components/price_tag.dart';
// import '../../../../Business_Logic/bloc/cart/total product count/total_product_count_bloc.dart';
// import '../../../../Business_Logic/bloc/cart/view cart/view_cart_product_list_bloc.dart';
// import '../../../constant.dart';
// import 'cart_product.dart';
// import 'text_form_field_with_button.dart';

// class ProductWithCart extends StatefulWidget {
//   final List<CartProductData> cartProductData;
//   final String token;
//   const ProductWithCart({
//     Key? key,
//     required this.cartProductData,
//     required this.token,
//   }) : super(key: key);

//   @override
//   State<ProductWithCart> createState() => _ProductWithCartState();
// }

// class _ProductWithCartState extends State<ProductWithCart> {
//   final RemoveCartItemBloc removeCartItemBloc = RemoveCartItemBloc();
//   late ViewCartProductListBloc viewCartProductListBloc;
//   late TotalProductCountBloc totalProductCountBloc;
//   @override
//   Widget build(BuildContext context) {
//     totalProductCountBloc = BlocProvider.of<TotalProductCountBloc>(context);
//     viewCartProductListBloc= BlocProvider.of<ViewCartProductListBloc>(context);
//     return BlocProvider(
//       create: (context) => removeCartItemBloc,
//       child: BlocConsumer<RemoveCartItemBloc, RemoveCartItemState>(
//         listener: (context, state) {
//           if (state is RemoveCartItemSuccess) {
//             viewCartProductListBloc.add(LoadCartProductList(widget.token));
//             totalProductCountBloc.add(LoadTotalCartProductCount(widget.token));
//           }
//           if (state is RemoveCartItemFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//                 defaultSnackBar(state.message, Colors.red, Colors.white, 2000));
//           }
//         },
//         builder: (context, state) {
//           // if (state is RemoveCartItemLoading) {
//           //   return Transform.translate(
//           //     offset: Offset(0, SizeConfig.screenHeight! * 0.33),
//           //     child: const Center(
//           //       child: CircularProgressIndicator(
//           //         strokeWidth: 5.0,
//           //         color: kDefaultSecondaryButtonColor,
//           //         backgroundColor: Colors.transparent,
//           //       ),
//           //     ),
//           //   );
//           // }
//           return Column(
//             children: [
//               //List of Card Product
//               ListView.builder(
                 
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: widget.cartProductData.length,
//                   itemBuilder: (context, index) {
//                     return CartProduct(
//                       cartProduct: widget.cartProductData[index],
//                       token: widget.token,
//                       onPressed: (cartItemId) {
//                         // setState(() {
//                         //   widget.cartProductData.removeAt(index);
//                         // });

//                         removeCartItemBloc
//                             .add(RemoveItemCart(cartItemId, widget.token));
//                       },
//                     );
//                   }),

//               //************Order Summary*******//
//               Container(
//                 width: double.infinity,
//                 margin: EdgeInsets.all(getProportionateScreenWidth(10.0)),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: kDefaultBorderColor),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding:
//                           EdgeInsets.all(getProportionateScreenWidth(10.0)),
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(color: kDefaultBorderColor),
//                         ),
//                       ),
//                       child: Text(
//                         "Order Summary",
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(15.0)),
//                       ),
//                     ),
//                     Container(
//                       padding:
//                           EdgeInsets.all(getProportionateScreenWidth(10.0)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                 "Total",
//                                 style: TextStyle(
//                                     fontSize:
//                                         getProportionateScreenWidth(15.0)),
//                               ),
//                               const Spacer(),
//                               const PriceTag(price: "2519")
//                             ],
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(10.0),
//                           ),
//                           Text(
//                             "* Inclusive of all taxes",
//                             style: TextStyle(
//                                 fontSize: getProportionateScreenWidth(12.0),
//                                 color: Colors.green),
//                           ),
//                           const Divider(
//                             color: kDefaultBorderColor,
//                             thickness: 1,
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(10.0),
//                           ),
//                           //Pin Check out Input
//                           const TextFormFieldAndButton(
//                             buttonTitle: "Check",
//                             hintText: "Enter Pincode",
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(10.0),
//                           ),

//                           //Continue Checkout Button
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(context, BillingAddress.id);
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 primary:
//                                     kDefaultSecondaryButtonColor, // background
//                                 onPrimary: Colors.white,
//                                 shape: const RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(3.0),
//                                   ), // <-- Radius
//                                 ), // foreground
//                               ),
//                               child: Text(
//                                 "Continue Checkout",
//                                 style: TextStyle(
//                                     fontSize:
//                                         getProportionateScreenWidth(15.0)),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),

//               //****************Coupon Discount**************//
//               Container(
//                 width: double.infinity,
//                 margin: EdgeInsets.all(getProportionateScreenWidth(10.0)),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: kDefaultBorderColor),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding:
//                           EdgeInsets.all(getProportionateScreenWidth(10.0)),
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(color: kDefaultBorderColor),
//                         ),
//                       ),
//                       child: Text(
//                         "Coupon Discount",
//                         style: TextStyle(
//                             fontSize: getProportionateScreenWidth(15.0)),
//                       ),
//                     ),
//                     Container(
//                       padding:
//                           EdgeInsets.all(getProportionateScreenWidth(10.0)),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           //Coupon code Input Field
//                           const TextFormFieldAndButton(
//                             buttonTitle: "Apply",
//                             hintText: "Enter Coupon Code",
//                           ),

//                           SizedBox(
//                             height: getProportionateScreenHeight(5.0),
//                           ),
//                           const Divider(
//                             color: kDefaultBorderColor,
//                             thickness: 1,
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(15.0),
//                           ),

//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Icon(
//                                 Icons.info_sharp,
//                                 size: getProportionateScreenHeight(20.0),
//                               ),
//                               SizedBox(
//                                 width: getProportionateScreenWidth(5.0),
//                               ),
//                               Text(
//                                 "Need any help?",
//                                 style: TextStyle(
//                                     fontSize:
//                                         getProportionateScreenWidth(15.0)),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: getProportionateScreenHeight(5.0),
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 "Speak to Our e-commerce specialist :",
//                                 style: TextStyle(
//                                     fontSize:
//                                         getProportionateScreenWidth(12.0)),
//                               ),
//                               SizedBox(
//                                 width: getProportionateScreenWidth(5),
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.phone_sharp,
//                                     size: getProportionateScreenHeight(13.0),
//                                     color: Colors.green,
//                                   ),
//                                   FittedBox(
//                                     fit: BoxFit.contain,
//                                     child: Text(
//                                       "18002677888",
//                                       style: TextStyle(
//                                           fontSize:
//                                               getProportionateScreenWidth(13.0),
//                                           color: Colors.green),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
