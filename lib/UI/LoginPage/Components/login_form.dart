import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/LoginPage/Components/text_input_field.dart';

import '../../../constant/constant.dart';
import '../../main_screen.dart';
import '../../size_config.dart';
import '../forgot_password.dart';
import '../sign_up_form.dart';
import 'button_with_logo.dart';
import 'custom_submit_button.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    Key? key,
  }) : super(key: key);

  //This is key for form that uniquely identifies form
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20.0),
              vertical: getProportionateScreenHeight(20.0)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //Login Page
                Text(
                  "Login",
                  style: TextStyle(fontSize: getProportionateScreenWidth(25)),
                ),
                const Divider(
                  color: kDefaultBorderColor,
                  thickness: 1,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(35.0),
                ),

                //Email Field
                TextInputField(
                  title: "E-Mail",
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _email,
                  isMandatory: true,
                  obscureText: false,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25.0),
                ),

                //Password Field
                TextInputField(
                  title: "Password",
                  textInputType: TextInputType.text,
                  textEditingController: _password,
                  isMandatory: true,
                  obscureText: true,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5.0),
                ),

                //Forgot Password
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MainScreen.id);
                      },
                      child: Text(
                        "Return To Store",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: getProportionateScreenWidth(14.0)),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPassword.id);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: getProportionateScreenWidth(14.0)),
                      ),
                    ),
                  ],
                ),

                const Divider(
                  color: kDefaultBorderColor,
                  thickness: 1,
                ),

                SizedBox(
                  height: getProportionateScreenHeight(35.0),
                ),

                //Login Button
                LoginButton(
                  title: "Login",
                  onPress: () {
                    //  context.read<LoginBloc>().add(LoginButtonPressed(
                    //     username: _email.text, password: _password.text));
                  },
                  color: const Color(0xFF1F99CF),
                  height: 40.0,
                  width: double.infinity,
                ),

                SizedBox(
                  height: getProportionateScreenHeight(25.0),
                ),

                //Sign in With
                Text("- OR -",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15.0),
                    )),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),
                Text(
                  "Sign in with",
                  style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Login With Google Button
                    ButtonWithLogo(
                      title: "Google",
                      imageSrc: "assets/google_logo.png",
                      onPress: () {},
                    ),

                    //Login With OTP Button
                    SizedBox(
                      height: 40,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.message_sharp,
                          size: getProportionateScreenWidth(20.0),
                        ),
                        label: Text(
                          "OTP",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15.0)),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF1F99CF), // background
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ), // <-- Radius
                          ), // foreground
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25.0),
                ),
                //Login With Apple Button
                ButtonWithLogo(
                  width: double.infinity,
                  title: "Sign in with Apple Id",
                  imageSrc: "assets/apple_logo.png",
                  onPress: () {},
                ),

                SizedBox(
                  height: getProportionateScreenHeight(25.0),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an Account? ',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15.0),
                        color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(15.0),
                              color: Colors.green),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, SignUpForm.id);
                            }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
