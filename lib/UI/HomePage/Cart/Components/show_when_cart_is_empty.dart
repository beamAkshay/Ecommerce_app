import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/main_screen.dart';
import '../../../size_config.dart';
import '../../../../constant/constant.dart';


class ShowWhenCartIsEmpty extends StatelessWidget {
  const ShowWhenCartIsEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: const AssetImage("assets/cart_empty.png"),
          width: double.infinity,
          height: getProportionateScreenHeight(300.0),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10.0),
        ),
        Text("YOUR SHOPPING CART IS EMPTY",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(25.0),
                color: kDefaultHeaderFontColor)),
        SizedBox(
          height: getProportionateScreenHeight(20.0),
        ),
        Text(
          "Please click the button below to continue shopping",
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: getProportionateScreenWidth(15.0)),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20.0),
        ),
        OutlinedButton.icon(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return MainScreen(selectedIndex: 0);
            }));
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: const Color(0xFF0B78A8),
            size: getProportionateScreenHeight(20.0),
          ),
          label: Text(
            "Return to Homepage",
            style: TextStyle(
                color: const Color(0xFF0B78A8),
                fontSize: getProportionateScreenWidth(14.0)),
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
              return const BorderSide(
                  color: Color(0xFF0B78A8), width: 1);
            }),
          ),
        )
      ],
    );
  }
}
