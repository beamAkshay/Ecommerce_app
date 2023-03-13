import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/forgot_password/forgot_password_bloc.dart';
import 'package:unicorn_store/UI/Components/loading_indicator_bar.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/LoginPage/Components/form_validation.dart';
import 'package:unicorn_store/UI/LoginPage/Components/text_input_field.dart';
import 'package:unicorn_store/UI/main_screen.dart';
import 'package:unicorn_store/UI/size_config.dart';
import 'package:unicorn_store/constant/constant.dart';

import 'login_form.dart';

class ForgotPassword extends StatefulWidget {
  static String id = "Forgot_Password";

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  //Creating variable for forgot password bloc
  ForgotPasswordBloc forgotPasswordBloc = ForgotPasswordBloc();

  // ignore: prefer_typing_uninitialized_variables
  var naviagationDetails;

  final _formKey = GlobalKey<FormState>();

  //Creating controller for textInput field
  final TextEditingController _emailId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: BlocProvider(
        create: (context) => forgotPasswordBloc,
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordResetSuccess) {
              if (state.forgotPasswordResponse!.data!.responce.toString() ==
                  "New password had been sent on email") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("New password had been sent on email."),
                    backgroundColor: Colors.green,
                    duration: Duration(milliseconds: 2000),
                    // behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Customer not found by this email id."),
                    backgroundColor: Colors.red,
                    duration: Duration(milliseconds: 2000),
                    // behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            }
            if (state is ForgotPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                  duration: const Duration(milliseconds: 2000),
                  // behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
            builder: (context, state) {
              if (state is ForgotPasswordLoading) {
                return const LoadingIndicatorBar();
              }
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Forgot Password",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(25.0),
                                color: kDefaultHeaderFontColor)),
                        const Divider(
                          color: kDefaultBorderColor,
                          thickness: 1,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15.0),
                        ),
                        TextInputField(
                            title: "E-Mail",
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                             return FormValidation.emailValidation(value);
                            },
                            textEditingController: _emailId,
                            isMandatory: true,
                            obscureText: false),
                        SizedBox(
                          height: getProportionateScreenHeight(15.0),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15.0),
                        ),
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
                                    fontSize:
                                        getProportionateScreenWidth(15.0)),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, LoginScreen.id);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize:
                                        getProportionateScreenWidth(15.0)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15.0),
                        ),
                        LoginButton(
                            width: double.infinity,
                            title: "Reset Password",
                            height: getProportionateScreenHeight(45.0),
                            color: const Color(0xFF1F99CF),
                            onPress: () {
                              if (_formKey.currentState!.validate()) {
                                forgotPasswordBloc.add(
                                    ResetPasswordButtonPressedEvent(
                                        emailId: _emailId.text));
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
