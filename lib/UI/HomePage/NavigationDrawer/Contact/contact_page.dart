import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/HomePage/Components/header_text.dart';
import 'package:unicorn_store/UI/HomePage/NavigationDrawer/Contact/Components/paragraph_content.dart';
import 'package:unicorn_store/UI/HomePage/NavigationDrawer/Contact/Components/text_input_for_contact_page.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/size_config.dart';
import 'package:unicorn_store/UI/text_file.dart';

import '../../../../constant/constant.dart';

class ContactPage extends StatefulWidget {
  static String id = "ContactPage_Screen";

  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isChecked = false;
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Heading and Information
              Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15.0)),
                child: Column(
                  children: [
                   const HeaderText(header: "Hello"),
                    const ParagraphContents(
                      paragraph:
                          "As your local Apple Experts we are always happy to help. If there is anything you would like to ask us, please get in touch.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25.0),
                    ),
                    const ParagraphContents(
                      paragraph:
                          "If your question relates to our online store then feel free to browse through our FAQs for more information about delivery, returns policy and payment.",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: MaterialStateProperty.resolveWith<BorderSide>(
                            (Set<MaterialState> states) {
                          return const BorderSide(
                              color: Color(0xFF0B78A8), width: 2);
                        }),
                      ),
                      child: Text(
                        "Go to Our FAQs",
                        style: TextStyle(
                            color: const Color(0xFF0B78A8),
                            fontSize: getProportionateScreenWidth(15.0)),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15.0),
                    ),
                    const Divider(
                      color: kDefaultBorderColor,
                      thickness: 2,
                    ),
                  ],
                ),
              ),

              //Get in Touch Form
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0)),
                child: Column(
                  children: [
                   const HeaderText(header: "Get in Touch"),
                    const ParagraphContents(
                        textAlign: TextAlign.center,
                        paragraph:
                            "Please fill in the form below and we will get back to you as soon as possible."),

                    //***************Contact Us Form***************

                    SizedBox(
                      height: getProportionateScreenHeight(45.0),
                    ),
                    //Full Name
                    TextInputForContactPage(
                      height: getProportionateScreenHeight(45.0),
                      title: "Full Name :",
                      isMandatory: false,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),

                    //Email
                    TextInputForContactPage(
                      height: getProportionateScreenHeight(45.0),
                      title: "Email :",
                      isMandatory: false,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),

                    //Phone No:
                    TextInputForContactPage(
                      height: getProportionateScreenHeight(45.0),
                      title: "Phone No :",
                      isMandatory: false,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),

                    //Reason DropDownField
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reason :",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16.0),
                              color: kDefaultTitleFontColor),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5.0),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xFFEEEEEE),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3.0)),
                              border: Border.all(
                                  width: 1, color: kDefaultBorderColor)),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  canvasColor: const Color(0xFFEEEEEE),
                                ),
                                child: DropdownButton<String>(
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
                                  hint: Text("Please Select a Subject",
                                      style: TextStyle(
                                          color: const Color(0xFF454545),
                                          fontSize: getProportionateScreenWidth(
                                              15.0))),
                                  items: <String>[
                                    'Im interested in buying ',
                                    'Two',
                                    'Free',
                                    'Four',
                                    'Im interested in buying1 ',
                                    'Two1',
                                    'Free1',
                                    'Four1',
                                    'Im in2terested in buying ',
                                    'Two2',
                                    'Free2',
                                    'Four2',
                                    'Im 3interested in buying ',
                                    'Two3',
                                    'Free3',
                                    'Four3',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(20.0),
                    ),

                    //Message:
                    TextInputForContactPage(
                      textAlignVertical: TextAlignVertical.top,
                      height: getProportionateScreenHeight(100.0),
                      title: "Message :",
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      isMandatory: false,
                      obscureText: false,
                    ),

                    // SizedBox(
                    //   height: getProportionateScreenHeight(4.0),
                    // ),
                  ],
                ),
              ),

              //Agree Term and Condition
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    checkColor: Colors.white,
                    activeColor: const Color(0xFF1F99CF),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(15.0),
                          top: getProportionateScreenWidth(8.0)),
                      child: RichText(
                        text: TextSpan(
                          text:
                              'Please click here to confirm you have read and agree to our',
                          style: TextStyle(
                              color: kDefaultTitleFontColor,
                              height: 1.5,
                              fontSize: getProportionateScreenWidth(16.0)),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' terms and conditions',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16.0),
                                    color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                            TextSpan(
                                text: ' and ',
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(16.0),
                                )),
                            TextSpan(
                                text: 'privacy policy.',
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16.0),
                                    color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(5.0),
              ),

              //Submit Button
              LoginButton(
                  title: "Submit",
                  color: const Color(0xFF1F99CF),
                  onPress: () {
                    Navigator.pushNamed(context, TextFile.id);
                  }),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
