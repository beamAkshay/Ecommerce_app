import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/account%20information/getting%20account%20details/account_information_api_fetch_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/account_info_details.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Account%20Information/address_details.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/LoginPage/Components/form_validation.dart';
import 'package:unicorn_store/UI/LoginPage/Components/text_input_field.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../constant/constant.dart';

class AccountInformationPage extends StatefulWidget {
  static String id = "AccountInformationPage";
  const AccountInformationPage({Key? key}) : super(key: key);

  @override
  State<AccountInformationPage> createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  bool isChecked = false;

  //Creating bloc instance
  AccountInformationApiFetchBloc accountInformationApiFetchBloc =
      AccountInformationApiFetchBloc();

  //This is key for form that uniquely identifies form
  final _formKey = GlobalKey<FormState>();

  String? dropdownValue = 'Select Gender';

  //Creating instance for loginData
  LoginData? loginData;

  //Crating instance for User Account information
  AccountInfoDetails? accountInfoDetails;

  // ignore: prefer_typing_uninitialized_variables
  var userData;

  String? emailSubscribe;

  //Defining form field controller
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _gst = TextEditingController();

  void setFormFieldData(AccountInfoDetails? accountData) {
    _companyName.text = accountData!.data!.company.toString();
    _firstName.text = accountData.data!.firstname.toString();
    _lastName.text = accountData.data!.lastname.toString();
    _email.text = accountData.data!.email.toString();
    _phone.text = accountData.data!.phone.toString();
    _gst.text = accountData.data!.gst.toString();

    if (accountData.data!.gender == null) {
      dropdownValue = "Select Gender";
    } else {
      dropdownValue = accountData.data!.gender.toString();
    }
    emailSubscribe = accountData.data!.emailSubscribe.toString();
  }

  @override
  void didChangeDependencies() {
    userData = ModalRoute.of(context)?.settings.arguments;
    loginData = userData["loginData"];

    //Adding event to load Account Information
    accountInformationApiFetchBloc.add(LoadAccountDetailsApiFetch(
        token: loginData!.userData!.token!.toString()));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: BlocProvider(
        create: (context) => accountInformationApiFetchBloc,
        child: BlocListener<AccountInformationApiFetchBloc,
            AccountInformationApiFetchState>(
          listener: (context, state) {
            if (state is AccountInformationApiFetchLoaded) {
              setState(() {
                accountInfoDetails = state.accountInfoDetails;
              });
              setFormFieldData(accountInfoDetails);
            } else if (state is UpdateCustomerAccountDetailsSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      const Text("Your Account information has been updated!"),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  duration: const Duration(milliseconds: 2000),
                  // behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: BlocBuilder<AccountInformationApiFetchBloc,
              AccountInformationApiFetchState>(
            builder: (context, state) {
              if (state is AccountInformationApiFetchLoading) {
                return const LinearIndicatorBar();
              }
              return _buildAccountInformationForm(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInformationForm(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: getProportionateScreenHeight(15.0),
                    left: getProportionateScreenHeight(15.0),
                    right: getProportionateScreenHeight(15.0)),
                child: Column(
                  children: [
                    //Company
                    TextInputField(
                      title: "Company",
                      textInputType: TextInputType.name,
                      hintText: "Company...",
                      textEditingController: _companyName,
                      isMandatory: false,
                      obscureText: false,
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //First Name
                    TextInputField(
                      title: "First Name",
                      textInputType: TextInputType.name,
                      hintText: "First Name...",
                      textEditingController: _firstName,
                      isMandatory: false,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //Last Name
                    TextInputField(
                      title: "Last Name",
                      textInputType: TextInputType.name,
                      hintText: "Last Name...",
                      textEditingController: _lastName,
                      isMandatory: false,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //Email
                    TextInputField(
                      title: "Email",
                      textInputType: TextInputType.emailAddress,
                      hintText: "Email...",
                      textEditingController: _email,
                      isMandatory: false,
                      obscureText: false,
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //Phone No
                    TextInputField(
                      title: "Phone",
                      textInputType: TextInputType.number,
                      hintText: "Phone No...",
                      textEditingController: _phone,
                      isMandatory: false,
                      obscureText: false,
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //Password
                    TextInputField(
                      title: "Password",
                      textInputType: TextInputType.text,
                      hintText: "Password...",
                      validator: (value) {
                        return FormValidation.accountInfoPasswordValidation(
                            value);
                      },
                      textEditingController: _password,
                      isMandatory: false,
                      obscureText: true,
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //Confirm Password
                    TextInputField(
                      title: "Confirm Password",
                      textInputType: TextInputType.text,
                      hintText: "Confirm Password...",
                      validator: (value) {
                        return FormValidation
                            .accountInfoConfirmPasswordValidation(value);
                      },
                      textEditingController: _confirmPassword,
                      isMandatory: false,
                      obscureText: true,
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //GSTIN NO.
                    TextInputField(
                      title: "GSTIN NO.",
                      textInputType: TextInputType.number,
                      hintText: "GSTIN NO...",
                      textEditingController: _gst,
                      isMandatory: false,
                      obscureText: false,
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),

                    //Gender DropDown
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender :",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16.0),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5.0),
                        ),
                        Container(
                          height: getProportionateScreenWidth(45),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3.0)),
                              border: Border.all(
                                  width: 1, color: kDefaultBorderColor)),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                isDense: true,
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 0,
                                style: TextStyle(
                                    color: const Color(0xFF454545),
                                    fontSize:
                                        getProportionateScreenWidth(15.0)),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                isExpanded: true,
                                items: <String>[
                                  'Select Gender',
                                  'Male',
                                  'Female',
                                  'Other',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    checkColor: Theme.of(context).colorScheme.onPrimary,
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: (emailSubscribe == "1") ? true : false,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value!) {
                          emailSubscribe = "1";
                        } else {
                          emailSubscribe = "0";
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
                            fontSize: getProportionateScreenWidth(15.0)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(5.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(15.0),
                    vertical: getProportionateScreenHeight(5.0)),
                child: LoginButton(
                  title: "Submit",
                  height: 40.0,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      AddressDetails addressDetails = AddressDetails(
                          id: int.parse(loginData!.userData!.id.toString()),
                          firstname: _firstName.text,
                          lastname: _lastName.text,
                          email: _email.text,
                          emailSubscribe: int.parse(emailSubscribe.toString()),
                          phone: _phone.text,
                          password: _password.text,
                          company: _companyName.text,
                          gst: _gst.text,
                          gender: (dropdownValue == "Select Gender")
                              ? null
                              : dropdownValue);

                      accountInformationApiFetchBloc.add(
                          UpdateCustomerAccountDetailsEvent(
                              addressData: addressDetails,
                              token: loginData!.userData!.token!));
                    }
                  },
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primary,
                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
