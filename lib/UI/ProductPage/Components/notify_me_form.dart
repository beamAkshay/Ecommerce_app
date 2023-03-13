import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/ProductPage/Components/text_form_field_intput.dart';

import '../../../constant/constant.dart';
import '../../size_config.dart';

class NotifyMeForm extends StatelessWidget {
  const NotifyMeForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: getProportionateScreenWidth(280),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: getProportionateScreenHeight(10.0),
            ),
            Text("Notify me when available",
                style: TextStyle(
                    height: 1.5,
                    fontSize: getProportionateScreenWidth(20.0),
                    color: kDefaultHeaderFontColor)),
            SizedBox(
              height: getProportionateScreenHeight(5.0),
            ),
            const Divider(
              color: kDefaultBorderColor,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15.0)),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(10.0),
                  ),
                  const TextFormFieldInput(
                      hintText: "Enter Your Name.",
                      isMandatory: false,
                      obscureText: false),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  const TextFormFieldInput(
                      hintText: "Enter Mobile No.",
                      isMandatory: false,
                      obscureText: false),
                  SizedBox(
                    height: getProportionateScreenHeight(10.0),
                  ),
                ],
              ),
            ),
            const Divider(
              color: kDefaultBorderColor,
              thickness: 1,
            ),
            SizedBox(
              height: getProportionateScreenHeight(5.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20.0)),
              child: Row(
                children: [
                  LoginButton(
                      title: "Notify Me",
                      color: kDefaultSecondaryButtonColor,
                      onPress: () {}),
                  const Spacer(),
                  LoginButton(
                    title: "Close",
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.grey[400]!,
                    onPrimary: Colors.black38,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5.0),
            ),
          ],
        ),
      ),
    );
  }
}
