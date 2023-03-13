// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/login/login_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Register/register_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';
import 'package:unicorn_store/UI/Components/loading_indicator_bar.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import '../size_config.dart';
import 'Components/custom_submit_button.dart';
import 'Components/form_validation.dart';
import 'Components/text_input_field.dart';

class SignUpForm extends StatefulWidget {
  static String id = "SignUpForm_Screen";

  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isChecked = false;

  //creating instance for login bloc
  late LoginBloc loginBloc;

  final _formKey = GlobalKey<FormState>();

  int emailSubscribe = 0;

  @override
  void initState() {
    loginBloc = LoginBloc(
        RepositoryProvider.of<AddToLocalCartRepository>(context),
        BlocProvider.of<AuthenticationBloc>(context));
    super.initState();
  }

  //Creating controller for textInput field
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _gst = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: BlocProvider(
        create: (context) => loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is RegistrationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "User has been register successfully.",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  duration: const Duration(milliseconds: 2000),
                  // behavior: SnackBarBehavior.floating,
                ),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error.toString(),
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.onError),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.error,
                  duration: const Duration(milliseconds: 2000),
                ),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const LoadingIndicatorBar();
              }
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //**********************Create New Account**************************//
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(15.0),
                            ),
                            Text(
                              "Create New Account",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(25)),
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.outline,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //Company Name
                            TextInputField(
                              title: "Company",
                              textEditingController: _companyName,
                              textInputType: TextInputType.name,
                              isMandatory: false,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //First Name
                            TextInputField(
                              title: "First Name",
                              validator: (value) {
                                return FormValidation.firstNameValidation(
                                    value);
                              },
                              textEditingController: _firstName,
                              textInputType: TextInputType.name,
                              isMandatory: true,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5.0),
                            ),

                            //Last Name
                            TextInputField(
                              title: "Last Name",
                              textEditingController: _lastName,
                              validator: (value) {
                                return FormValidation.lastNameValidation(value);
                              },
                              textInputType: TextInputType.name,
                              isMandatory: true,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //Email
                            TextInputField(
                              title: "Email",
                              textEditingController: _email,
                              validator: (value) {
                                return FormValidation.emailValidation(value);
                              },
                              isMandatory: true,
                              textInputType: TextInputType.emailAddress,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //Phone no
                            TextInputField(
                              title: "Phone",
                              textEditingController: _phone,
                              validator: (value) {
                                return FormValidation.phoneNumberValidation(
                                    value);
                              },
                              textInputType: TextInputType.number,
                              isMandatory: true,
                              obscureText: false,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //Password
                            TextInputField(
                              title: "Password",
                              textEditingController: _password,
                              validator: (value) {
                                return FormValidation.passwordValidation(value);
                              },
                              textInputType: TextInputType.text,
                              isMandatory: true,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //Confirm Password
                            TextInputField(
                              title: "Confirm Password",
                              textEditingController: _confirmPassword,
                              validator: (value) {
                                return FormValidation.confirmPasswordValidation(
                                    value);
                              },
                              textInputType: TextInputType.text,
                              isMandatory: true,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),

                            //GSTIN
                            TextInputField(
                              title: "GSTIN.",
                              textEditingController: _gst,
                              textInputType: TextInputType.number,
                              isMandatory: false,
                              obscureText: false,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(7.0)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              // checkColor: Colors.white,
                              // activeColor: const Color(0xFF1F99CF),
                              value: (emailSubscribe == 1) ? true : false,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value!) {
                                    emailSubscribe = 1;
                                  } else {
                                    emailSubscribe = 0;
                                  }
                                });
                              },
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: getProportionateScreenWidth(15.0)),
                                child: Text(
                                  'Subscribe to our email list',
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(15.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5.0),
                      ),

                      //Login Button
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(20.0),
                        ),
                        child: LoginButton(
                          width: double.infinity,
                          title: "Register",
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              RegisterData registerData = RegisterData(
                                  company: _companyName.text,
                                  firstname: _firstName.text,
                                  lastname: _lastName.text,
                                  email: _email.text,
                                  phone: _phone.text,
                                  password: _password.text,
                                  gst: _gst.text,
                                  emailSubscribe: emailSubscribe);

                              //Register event calling
                              loginBloc.add(SignupButtonPressed(
                                  registerData: registerData));
                            }
                          },
                          color: Theme.of(context).colorScheme.secondary,
                          onPrimary: Theme.of(context).colorScheme.onSecondary,
                          height: 40.0,
                        ),
                      ),

                      //*******************************Message***************************************//

                      SizedBox(
                        height: getProportionateScreenHeight(10.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20.0),
                            vertical: getProportionateScreenHeight(5.0)),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Flexible(
                                  child: Text(
                                    "Sign up today and you'll be able to :",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_rounded,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: getProportionateScreenWidth(20.0),
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10.0)),
                                Text(
                                  "Speed your way through the checkout",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(14.0)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_rounded,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: getProportionateScreenWidth(20.0),
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10.0)),
                                Text(
                                  "Track your orders easily",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(14.0)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_rounded,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: getProportionateScreenWidth(20.0),
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10.0)),
                                Text(
                                  "Keep a record of all your purchases",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(14.0)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10.0),
                      ),
                    ],
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
