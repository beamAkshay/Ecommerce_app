import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/address_manager_details_api_fetch_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/set_default_address_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/address.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/address_list.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/My%20Account/Address%20Manager/address_manager_form.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../constant/constant.dart';

class AddressManagerPage extends StatefulWidget {
  static String id = "Address_Manager";
  const AddressManagerPage({Key? key}) : super(key: key);

  @override
  State<AddressManagerPage> createState() => _AddressManagerPageState();
}

class _AddressManagerPageState extends State<AddressManagerPage> {
  String? billing;
  String? shipping;

  String? secondBillingValue = " ";
  String? secondShippingValue = " ";

  List<Address>? address;
  //Creating object for category bloc
  final AddressManagerDetailsApiFetchBloc _addressManagerDetailsApiFetchBloc =
      AddressManagerDetailsApiFetchBloc();
  final SetDefaultAddressBloc _setDefaultAddressBloc = SetDefaultAddressBloc();

  // ignore: prefer_typing_uninitialized_variables
  var userData;

  //Creating instance for LoginData
  LoginData? loginData;

  @override
  void didChangeDependencies() {
    userData = ModalRoute.of(context)?.settings.arguments;
    loginData = userData["loginData"];
    _addressManagerDetailsApiFetchBloc
        .add(LoadAddressDetailsApiFetch(token: loginData!.userData!.token!));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: SafeArea(
        child:

            //When Address is Empty
            // Container(
            //   child: Center(
            //     child: Text(
            //       "No Address Available.",
            //       style: TextStyle(
            //           fontSize: getProportionateScreenWidth(15.0),
            //           color: kDefaultHeaderFontColor),
            //     ),
            //   ),
            // ),

            MultiBlocProvider(
          providers: [
            BlocProvider<AddressManagerDetailsApiFetchBloc>(
              create: (BuildContext context) =>
                  _addressManagerDetailsApiFetchBloc,
            ),
            BlocProvider<SetDefaultAddressBloc>(
              create: (BuildContext context) => _setDefaultAddressBloc,
            ),
          ],
          child: BlocListener<AddressManagerDetailsApiFetchBloc,
              AddressManagerDetailsApiFetchState>(
            listener: (context, state) {
              if (state is DeleteCustomerAddressSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Your address has been deleted!",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onTertiary),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    duration: const Duration(milliseconds: 2000),
                    // behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: BlocBuilder<AddressManagerDetailsApiFetchBloc,
                AddressManagerDetailsApiFetchState>(builder: (context, state) {
              if (state is AddressManagerDetailsApiFetchLoading) {
                return const LinearIndicatorBar();
              } else if (state is AddressManagerDetailsApiFetchLoaded) {
                return _buildAddressManagerList(context, state.addressList);
                // } else if (state is DefaultAdressSetState) {
                //   return _buildAddressManagerList(context, state.addressList);
                //
              } else if (state is AddressManagerDetailsApiFetchError) {
                return Center(
                  child: Text(state.message!),
                );
              } else if (state is DeleteCustomerAddressSuccess) {
                return _buildAddressManagerList(context, state.addressList);
              } else {
                return Container();
              }
            }),
          ),
        ),
      ),
    );
  }

  //List of User Address
  Widget _buildAddressManagerList(
      BuildContext context, AddressList addressList) {
    address = addressList.address;
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              LoginButton(
                title: "Add Address",
                onPress: () {
                  Navigator.pushNamed(context, AddressManagerForm.id,
                      arguments: {
                        "customerId": address![0].customerId.toString(),
                        "addressId": "",
                        "loginData": loginData
                      }).then((_) {
                    setState(() {
                      _addressManagerDetailsApiFetchBloc.add(
                          LoadAddressDetailsApiFetch(
                              token: loginData!.userData!.token!));
                    });
                  });
                },
                color: Theme.of(context).colorScheme.primary,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: address!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (address![index].defaultBillingAddress!) {
                      billing = address![index].id.toString();
                    }
                    if (address![index].defaultsShippingAddress!) {
                      shipping = address![index].id.toString();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          color: kDefaultBorderColor,
                          thickness: 1,
                        ),

                        //First name and last name
                        Text(
                          "${address![index].addressFieldData!.firstname}"
                          " "
                          "${address![index].addressFieldData!.lastname}",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15.0),
                              color: const Color(0xFF444444)),
                        ),

                        SizedBox(
                          height: getProportionateScreenHeight(5.0),
                        ),

                        //Phone number
                        Text(
                          "${address![index].addressFieldData!.phone}",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15.0),
                              color: const Color(0xFF444444)),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5.0),
                        ),

                        //Address1 and Address2
                        Text(
                          "${address![index].addressFieldData!.address1}"
                          ","
                          "  "
                          "${address![index].addressFieldData!.address2}",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15.0),
                              color: const Color(0xFF444444)),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5.0),
                        ),

                        //Zip Code
                        Text(
                          "${address![index].addressFieldData!.zip}",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15.0),
                              color: const Color(0xFF444444)),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5.0),
                        ),

                        //Country Name
                        Text(
                          "${address![index].addressFieldData!.country}",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15.0),
                              color: const Color(0xFF444444)),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30.0),
                        ),
                        //Default billing and shipping address
                        BlocBuilder<SetDefaultAddressBloc,
                            SetDefaultAddressState>(
                          builder: (context, state) {
                            return _buildDefaultBillingRadio(address, index);
                          },
                        ),

                        //Edit and Delete Button
                        Row(
                          children: [
                            LoginButton(
                              title: "Edit",
                              onPress: () {
                                Navigator.pushNamed(
                                    context, AddressManagerForm.id,
                                    arguments: {
                                      "customerId":
                                          address![index].customerId.toString(),
                                      "addressId":
                                          address![index].id.toString(),
                                      "loginData": loginData
                                    }).then((_) {
                                  setState(() {
                                    _addressManagerDetailsApiFetchBloc.add(
                                        LoadAddressDetailsApiFetch(
                                            token:
                                                loginData!.userData!.token!));
                                  });
                                });
                              },
                              color: Theme.of(context).colorScheme.primary,
                              onPrimary:
                                  Theme.of(context).colorScheme.onPrimary,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(15.0),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                if (addressList.address!.length == 1) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "You Must leave at least 1 address in the Address Manager.",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      ),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.error,
                                      duration:
                                          const Duration(milliseconds: 1500),
                                      // behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                } else {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Delete Address'),
                                      content: const Text(
                                          'Are you sure you want to delete this address?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            _addressManagerDetailsApiFetchBloc
                                                .add(DeleteCustomerAddressEvent(
                                                    addressId: address![index]
                                                        .id
                                                        .toString(),
                                                    token: loginData!
                                                        .userData!.token!));

                                            Navigator.pop(context, 'OK');
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                // backgroundColor:
                                //     Theme.of(context).colorScheme.secondary,
                                foregroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              child: const Text(
                                "Delete",
                              ),
                            ),
                            // LoginButton(
                            //   title: "Delete",
                            //   onPress: () {
                            //     if (addressList.address!.length == 1) {
                            //       ScaffoldMessenger.of(context).showSnackBar(
                            //         SnackBar(
                            //           content: Text(
                            //             "You Must leave at least 1 address in the Address Manager.",
                            //             style: TextStyle(
                            //               color: Theme.of(context)
                            //                   .colorScheme
                            //                   .error,
                            //             ),
                            //           ),
                            //           backgroundColor:
                            //               Theme.of(context).colorScheme.error,
                            //           duration:
                            //               const Duration(milliseconds: 1500),
                            //           // behavior: SnackBarBehavior.floating,
                            //         ),
                            //       );
                            //     } else {
                            //       showDialog<String>(
                            //         context: context,
                            //         builder: (BuildContext context) =>
                            //             AlertDialog(
                            //           title: const Text('Delete Address'),
                            //           content: const Text(
                            //               'Are you sure you want to delete this address?'),
                            //           actions: <Widget>[
                            //             TextButton(
                            //               onPressed: () =>
                            //                   Navigator.pop(context, 'Cancel'),
                            //               child: const Text('Cancel'),
                            //             ),
                            //             TextButton(
                            //               onPressed: () {
                            //                 _addressManagerDetailsApiFetchBloc
                            //                     .add(DeleteCustomerAddressEvent(
                            //                         addressId: address![index]
                            //                             .id
                            //                             .toString(),
                            //                         token: loginData!
                            //                             .userData!.token!));

                            //                 Navigator.pop(context, 'OK');
                            //               },
                            //               child: const Text('OK'),
                            //             ),
                            //           ],
                            //         ),
                            //       );
                            //     }
                            //   },
                            //   color: Theme.of(context).colorScheme.secondary,
                            //   onPrimary:
                            //       Theme.of(context).colorScheme.onSecondary,
                            // ),
                          ],
                        )
                      ],
                    );
                  }),
            ])));
  }

  //Radio button for Default Billing address and Default Shipping address
  Widget _buildDefaultBillingRadio(List<Address>? address, int index) {
    return Column(children: [
      //Default Billing
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20.0),
            width: getProportionateScreenHeight(20.0),
            child: Radio<String>(
              value: address![index].id.toString(),
              activeColor: Theme.of(context).colorScheme.primary,
              groupValue:
                  (secondBillingValue == " ") ? billing : secondBillingValue,
              onChanged: (String? value) {
                setState(() {
                  secondBillingValue = value;
                });
                _setDefaultAddressBloc.add(SetDefaultAddresssDetails(
                    addressId: address[index].id.toString(),
                    addressType: "billing",
                    token: loginData!.userData!.token!));
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10.0),
          ),
          Text(
            'Default Billing',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15.0),
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.8)),
          ),
        ],
      ),
      SizedBox(
        height: getProportionateScreenHeight(10.0),
      ),

      //Default Shipping
      Row(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20.0),
            width: getProportionateScreenHeight(20.0),
            child: Radio<String>(
              value: address[index].id.toString(),
              activeColor: Theme.of(context).colorScheme.primary,
              groupValue:
                  (secondShippingValue == " ") ? shipping : secondShippingValue,
              onChanged: (String? value) {
                _setDefaultAddressBloc.add(SetDefaultAddresssDetails(
                    addressId: address[index].id.toString(),
                    addressType: "shipping",
                    token: loginData!.userData!.token!));

                setState(() {
                  secondShippingValue = value;
                });
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10.0),
          ),
          Text(
            'Default Shipping',
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15.0),
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.8)),
          ),
        ],
      ),

      SizedBox(
        height: getProportionateScreenHeight(15.0),
      ),
    ]);
  }
}
