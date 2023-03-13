import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/edit%20address%20manager/edit_address_manager_data_fetch_api_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/load%20country%20and%20state/country_bloc/country_data_api_fetch_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/load%20country%20and%20state/state_bloc/state_data_api_fetch_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/search%20zip%20address/search_zip_address_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Country%20Dropdown/country_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Country%20Dropdown/data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/address_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Edit%20Address%20Manager/edit_address_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/State/data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/State/state_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/field_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/search_zip_address.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/LoginPage/Components/text_input_field.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../constant/constant.dart';
import '../../LoginPage/Components/form_validation.dart';

class AddressManagerForm extends StatefulWidget {
  static String id = "Address_Manager_Form_Screen";

  const AddressManagerForm({Key? key}) : super(key: key);

  @override
  State<AddressManagerForm> createState() => _AddressManagerFormState();
}

class _AddressManagerFormState extends State<AddressManagerForm> {
  String? dropdownValueForState;
  String? dropdownValueForCountry = "99";
  String secondDropdownvalueForState = " ";
  String secondDropdownvalueForCountry = " ";
  bool editAddressFlag = false;

  // ignore: prefer_typing_uninitialized_variables
  var addressManagerIds;

  //This is key for form that uniquely identifies form
  final _formKey = GlobalKey<FormState>();

  //List of state
  StateList? stateList;

  //List of country
  CountryList? countryDetailsList;

  //List of address
  EditAddressList? addressListData;

  //Country and state details class
  late Country countryDetails;
  late StateData stateData;

  //Creating bloc object
  final EditAddressManagerDataFetchApiBloc _editAddressManagerDataFetchApiBloc =
      EditAddressManagerDataFetchApiBloc();
  final SearchZipAddressBloc _searchZipAddressBloc = SearchZipAddressBloc();
  final CountryDataApiFetchBloc _countryDataApiFetchBloc =
      CountryDataApiFetchBloc();
  final StateDataApiFetchBloc _stateDataApiFetchBloc = StateDataApiFetchBloc();

  //Scroll Controller for custom scroll effect
  late ScrollController formScrollController;
  bool searchZipAddressHasData = false;

  //Defining form field controller
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _zip = TextEditingController();

  void setFormFieldData(EditAddressList editAddressList) {
    _firstName.text =
        editAddressList.addressData!.fieldDataEditAddress!.firstname.toString();
    _lastName.text =
        editAddressList.addressData!.fieldDataEditAddress!.lastname.toString();
    _email.text =
        editAddressList.addressData!.fieldDataEditAddress!.email.toString();
    _phone.text =
        editAddressList.addressData!.fieldDataEditAddress!.phone.toString();
    _address1.text =
        editAddressList.addressData!.fieldDataEditAddress!.address1.toString();
    _address2.text =
        editAddressList.addressData!.fieldDataEditAddress!.address2.toString();
    _city.text =
        editAddressList.addressData!.fieldDataEditAddress!.city.toString();
    _zip.text =
        editAddressList.addressData!.fieldDataEditAddress!.zip.toString();

    dropdownValueForCountry =
        editAddressList.addressData!.fieldDataEditAddress!.countryId.toString();

    dropdownValueForState =
        editAddressList.addressData!.fieldDataEditAddress!.zoneId.toString();

    _stateDataApiFetchBloc.add(LoadStateData(
        countryID: editAddressList.addressData!.fieldDataEditAddress!.countryId
            .toString(),
        token: loginData!.userData!.token!,
        eventChecker: false));
  }

  void setFormDataBasedOnZip(SearchZipAddress searchZipAddress) {
    _city.text = searchZipAddress.divisionname.toString();
    dropdownValueForState = searchZipAddress.stateId;
    secondDropdownvalueForCountry = searchZipAddress.countryId.toString();
    _stateDataApiFetchBloc.add(LoadStateData(
        countryID: searchZipAddress.countryId.toString(),
        token: loginData!.userData!.token!,
        eventChecker: false));
  }

  //Creating instance for user details after login
  LoginData? loginData;

  @override
  void initState() {
    formScrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    addressManagerIds =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    loginData = addressManagerIds["loginData"];
    if (addressManagerIds["addressId"].toString().isNotEmpty) {
      editAddressFlag = true;
      _countryDataApiFetchBloc
          .add(LoadCountryDataFetchApi(loginData!.userData!.token!));
      _editAddressManagerDataFetchApiBloc.add(
          LoadEditAddressManagerDataFetchApi(
              addressId: addressManagerIds["addressId"],
              token: loginData!.userData!.token!));
    } else {
      _countryDataApiFetchBloc
          .add(LoadCountryDataFetchApi(loginData!.userData!.token!));
      _stateDataApiFetchBloc.add(LoadStateData(
          countryID: "99",
          token: loginData!.userData!.token!,
          eventChecker: false));
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: (addressManagerIds["addressId"].toString().isNotEmpty)
          ? MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => _editAddressManagerDataFetchApiBloc,
                ),
                BlocProvider(
                  create: (context) => _searchZipAddressBloc,
                ),
                BlocProvider(
                  create: (context) => _countryDataApiFetchBloc,
                ),
                BlocProvider(
                  create: (context) => _stateDataApiFetchBloc,
                ),
              ],
              child: BlocListener<EditAddressManagerDataFetchApiBloc,
                  EditAddressManagerDataFetchApiState>(
                listener: (context, state) {
                  if (state is EditAddressManagerDataFetchApiLoaded) {
                    setState(() {
                      addressListData = state.editAddressList;
                    });
                    setFormFieldData(state.editAddressList);
                  } else if (state is UpdateCustomerAddressSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            "Your address has been Updated Successfully!"),
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        duration: const Duration(milliseconds: 2000),
                        // behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: BlocBuilder<EditAddressManagerDataFetchApiBloc,
                        EditAddressManagerDataFetchApiState>(
                    builder: (context, state) {
                  if (state is EditAddressManagerDataFetchApiLoading) {
                    return const LinearIndicatorBar();
                  } else if (state is EditAddressManagerDataFetchApiLoaded) {
                    return _buildEditAddressForm(context);
                  } else if (state is EditAddressManagerDataFetchApiError) {
                    return Center(
                      child: Text(state.message.toString()),
                    );
                  } else if (state is UpdateCustomerAddressSuccess) {
                    return _buildEditAddressForm(context);
                  } else {
                    return Container();
                  }
                }),
              ),
            )
          : MultiBlocProvider(
              providers: [
                  BlocProvider(
                    create: (context) => _editAddressManagerDataFetchApiBloc,
                  ),
                  BlocProvider(
                    create: (context) => _searchZipAddressBloc,
                  ),
                  BlocProvider(
                    create: (context) => _countryDataApiFetchBloc,
                  ),
                  BlocProvider(
                    create: (context) => _stateDataApiFetchBloc,
                  ),
                ],
              child: BlocListener<EditAddressManagerDataFetchApiBloc,
                  EditAddressManagerDataFetchApiState>(
                listener: (context, state) {
                  if (state is AddCustomerAddressSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                            "Your address has been Created Successfully!"),
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        duration: const Duration(milliseconds: 2000),
                        // behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: BlocBuilder<EditAddressManagerDataFetchApiBloc,
                    EditAddressManagerDataFetchApiState>(
                  builder: (context, state) {
                    return _buildEditAddressForm(context);
                  },
                ),
              )),
    );
  }

  Widget _buildEditAddressForm(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Address Form",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(25.0),
                        color: Theme.of(context).colorScheme.onBackground)),
                Divider(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 1,
                ),

                //First Name
                TextInputField(
                  title: "First Name",
                  validator: (value) {
                    return FormValidation.emptyFieldValidation(value);
                  },
                  textInputType: TextInputType.name,
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
                  validator: (value) {
                    return FormValidation.emptyFieldValidation(value);
                  },
                  textInputType: TextInputType.name,
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
                  validator: (value) {
                    return FormValidation.emailValidation(value);
                  },
                  textInputType: TextInputType.emailAddress,
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
                  validator: (value) {
                    return FormValidation.phoneNumberValidation(value);
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputType: TextInputType.number,
                  textEditingController: _phone,
                  isMandatory: false,
                  obscureText: false,
                ),

                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //Address 1
                TextInputField(
                  title: "Address 1",
                  validator: (value) {
                    return FormValidation.emptyFieldValidation(value);
                  },
                  textInputType: TextInputType.text,
                  textEditingController: _address1,
                  isMandatory: false,
                  obscureText: false,
                ),

                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //Address 2
                TextInputField(
                  title: "Address 2",
                  validator: (value) {
                    return FormValidation.emptyFieldValidation(value);
                  },
                  textInputType: TextInputType.text,
                  textEditingController: _address2,
                  isMandatory: false,
                  obscureText: false,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //City
                TextInputField(
                  title: "City",
                  validator: (value) {
                    return FormValidation.emptyFieldValidation(value);
                  },
                  textInputType: TextInputType.text,
                  textEditingController: _city,
                  isMandatory: false,
                  obscureText: false,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //Zip address
                BlocListener<SearchZipAddressBloc, SearchZipAddressState>(
                  listener: (context, state) {
                    if (state is SearchZipAddressLoaded) {
                      setFormDataBasedOnZip(state.searchAddressList);
                    }
                  },
                  child:
                      BlocBuilder<SearchZipAddressBloc, SearchZipAddressState>(
                    builder: (context, state) {
                      //Zip
                      return TextInputField(
                        title: "Zip",
                        textInputType: TextInputType.number,
                        textEditingController: _zip,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          return FormValidation.emptyFieldValidation(value);
                        },
                        onChanged: (value) {
                          if (dropdownValueForCountry == "99") {
                            if (value!.length == 6) {
                              secondDropdownvalueForState = " ";
                              dropdownValueForState = null;
                              _searchZipAddressBloc.add(LoadSearchZipAddress(
                                  pincode: value,
                                  token: loginData!.userData!.token!));
                              // if (formScrollController.hasClients) {
                              //   final position =
                              //       formScrollController.position.maxScrollExtent;
                              //   formScrollController.animateTo(
                              //     position,
                              //     duration: const Duration(milliseconds: 1000),
                              //     curve: Curves.easeOut,
                              //   );
                              // }
                              return " ";
                            }
                          }
                          return "";
                        },
                        isMandatory: false,
                        obscureText: false,
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                // Dropdown for Country
                BlocBuilder<CountryDataApiFetchBloc, CountryDataApiFetchState>(
                  builder: (context, state) {
                    if (state is CountryDataApiFetchLoded) {
                      countryDetailsList = state.countryList;
                      return _buildCountryDropDown(context, state.countryList);
                    } else {
                      return Container();
                    }
                  },
                ),

                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //Dropdown for state
                BlocListener<StateDataApiFetchBloc, StateDataApiFetchState>(
                  listener: (context, state) {
                    if (state is StateDataApiFetchLoaded) {
                      setState(() {
                        stateList = state.stateList;
                      });
                    }
                  },
                  child: BlocBuilder<StateDataApiFetchBloc,
                      StateDataApiFetchState>(
                    builder: (context, state) {
                      return _buildStateDropdown(context);
                    },
                  ),
                ),

                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),

                //Submit and Close Button
                Row(
                  children: [
                    LoginButton(
                        title: "Submit",
                        color: Theme.of(context).colorScheme.primary,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            countryDetails = countryNameDetailsSearch(
                                dropdownValueForCountry);

                            stateData =
                                stateNameDetailsSearch(dropdownValueForState);

                            AddressFieldData addressFieldData =
                                AddressFieldData(
                              _lastName.text,
                              _firstName.text,
                              _email.text,
                              int.parse(_phone.text),
                              _address1.text,
                              _address2.text,
                              _city.text,
                              int.parse(_zip.text),
                              stateData.name,
                              countryDetails.name,
                              countryDetails.isoCode2,
                              int.parse(dropdownValueForCountry.toString()),
                              int.parse(dropdownValueForState.toString()),
                            );
                            AddressData addressData =
                                AddressData(null, 25, " ", addressFieldData);

                            if (editAddressFlag) {
                              _editAddressManagerDataFetchApiBloc.add(
                                  UpdateCustomerAddressEvent(
                                      addressId: addressListData!
                                          .addressData!.id
                                          .toString(),
                                      addressData: addressData,
                                      token: loginData!.userData!.token!));
                            } else {
                              _editAddressManagerDataFetchApiBloc.add(
                                  AddCustomerAddressEvent(addressData,
                                      loginData!.userData!.token!));
                            }
                          }
                        }),
                    const Spacer(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Country countryNameDetailsSearch(String? countryId) {
    late Country country;
    for (var element in countryDetailsList!.country!) {
      if (element.id.toString() == countryId) {
        country = element;
      }
    }
    return country;
  }

  StateData stateNameDetailsSearch(String? stateId) {
    late StateData stateDetails;
    for (var element in stateList!.state) {
      if (element.id.toString() == stateId) {
        stateDetails = element;
      }
    }
    return stateDetails;
  }

  Widget _buildCountryDropDown(BuildContext context, CountryList? countryList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              "Country",
              style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
            ),
            const Positioned(
              right: -7,
              top: -4,
              child: Text("*"),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(5.0),
        ),
        Container(
          height: getProportionateScreenHeight(45.0),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3.0)),
              border: Border.all(width: 1, color: kDefaultBorderColor)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color(0xFFEEEEEE),
                ),
                child: DropdownButton<String>(
                  value: (secondDropdownvalueForCountry == " ")
                      ? dropdownValueForCountry
                      : secondDropdownvalueForCountry,
                  isDense: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 0,
                  style: TextStyle(
                      color: const Color(0xFF454545),
                      fontSize: getProportionateScreenWidth(15.0)),
                  onChanged: (String? newValue) {
                    setState(() {
                      secondDropdownvalueForCountry = newValue!;
                      dropdownValueForCountry = newValue;
                    });

                    _stateDataApiFetchBloc.add(LoadStateData(
                        countryID: newValue ?? " ",
                        token: loginData!.userData!.token!,
                        eventChecker: false));
                  },
                  hint: Text("Select Country",
                      style: TextStyle(
                          color: const Color(0xFF454545),
                          fontSize: getProportionateScreenWidth(15.0))),
                  isExpanded: true,
                  onTap: () {
                    dropdownValueForState = null;
                    secondDropdownvalueForState = " ";
                  },
                  items: countryList?.country!.map((item) {
                    return DropdownMenuItem(
                      value: item.id.toString(),
                      child: Text(item.name.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStateDropdown(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Text(
              "State",
              style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
            ),
            const Positioned(
              right: -7,
              top: -4,
              child: Text("*"),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenHeight(5.0),
        ),
        Container(
          height: getProportionateScreenHeight(45.0),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3.0)),
              border: Border.all(width: 1, color: kDefaultBorderColor)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: const Color(0xFFEEEEEE),
                ),
                child: DropdownButton<String>(
                  value: (secondDropdownvalueForState == " ")
                      ? dropdownValueForState
                      : secondDropdownvalueForState,
                  isDense: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 0,
                  style: TextStyle(
                      color: const Color(0xFF454545),
                      fontSize: getProportionateScreenWidth(15.0)),
                  onChanged: (String? newValue) {
                    setState(() {
                      secondDropdownvalueForState = newValue!;
                      dropdownValueForState = newValue;
                    });
                  },
                  hint: Text("Select State",
                      style: TextStyle(
                          color: const Color(0xFF454545),
                          fontSize: getProportionateScreenWidth(15.0))),
                  isExpanded: true,
                  items: stateList?.state.map((item) {
                    return DropdownMenuItem(
                      value: item.id.toString(),
                      child: Text(item.name.toString()),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
