// import 'package:flutter/material.dart';

// import '../../../size_config.dart';
// import '../../../../constant/constant.dart';

// class PaymentMethodContainer extends StatelessWidget {
//   const PaymentMethodContainer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color(0xFFFBFBFB),
//       padding: EdgeInsets.only(
//           left: getProportionateScreenHeight(10.0),
//           right: getProportionateScreenHeight(10.0),
//           top: getProportionateScreenHeight(10.0)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 "Payment Methods",
//                 style: TextStyle(
//                     fontSize: getProportionateScreenWidth(20.0),
//                     color: kDefaultTitleFontColor),
//               ),
//               const Spacer(),
//               Icon(
//                 Icons.check_rounded,
//                 color: Colors.green,
//                 size: getProportionateScreenHeight(30),
//               )
//             ],
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(15.0),
//           ),
//           Text(
//             "Payment Methods, Cod",
//             style: TextStyle(
//                 height: 1.5,
//                 color: kDefaultTitleFontColor,
//                 fontSize: getProportionateScreenWidth(15.0)),
//           ),
//           SizedBox(
//             height: getProportionateScreenHeight(5.0),
//           ),
//           const Divider(
//             color: kDefaultBorderColor,
//             thickness: 1,
//           ),
//         ],
//       ),
//     );
//   }
// }
