// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names
import 'dart:async';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selectable_container/selectable_container.dart';
import 'package:unicorn_store/Business_Logic/bloc/checkout/order%20summary/order_summary_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/checkout/payment%20module/payment_module_tansaction_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/checkout/search%20store%20address/search_store_address_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/load%20country%20and%20state/country_bloc/country_data_api_fetch_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/address%20manager/load%20country%20and%20state/state_bloc/state_data_api_fetch_bloc.dart';
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
import 'package:unicorn_store/Data/Models/Checkout/Order%20Summary/order_summary_data.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/Payment%20Module%20Data/payment_module.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/View%20Payment%20Module/view_payment_module.dart';
import 'package:unicorn_store/Data/Models/Checkout/Transaction/View%20Payment%20Module/view_payment_module_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default__addreses_field_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default_address_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default_billing_address_data.dart';
import 'package:unicorn_store/Data/Models/Default%20Address/default_shipping_address_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Country%20Dropdown/country_list.dart';
import 'package:unicorn_store/Data/Models/Search%20Store/search_store.dart';
import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/Components/payment_screen.dart';
import '../../../Business_Logic/bloc/checkout/default user address/default_user_address_bloc.dart';
import '../../../Data/Models/MyAccount/Address Manager/Country Dropdown/data.dart';
import '../../../Data/Models/MyAccount/Address Manager/State/data.dart';
import '../../Components/default_snackbar.dart';
import '../../Components/image_path.dart';
import '../../HomePage/Components/price_tag.dart';
import '../../../constant/constant.dart';
import '../../size_config.dart';
import 'Components/form_validation_mixin.dart';
import 'Components/payment_success.dart';
import 'Components/text_input_field_for_checkout.dart';

enum ShippingAddressEnum { billAddress, nearestUnicornStoreAddress, newAddress }

class CheckoutPage extends StatefulWidget {
  final String? token;
  final int currentStep;
  final List<CartProductData>? cartProductData;
  const CheckoutPage(
      {Key? key, this.token, required this.currentStep, this.cartProductData})
      : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with TickerProviderStateMixin, FormValidationMixin {
  late AnimationController controller;

  final _formKey = GlobalKey<FormState>();
  int? _currentStep;

  @override
  initState() {
    _currentStep = widget.currentStep;
    checkoutProcessBeginAnalyticsEvent();
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    // Animation duration for displaying the BottomSheet
    controller.duration = const Duration(seconds: 1);
    // Animation duration for retracting the BottomSheet
    //controller.reverseDuration = const Duration(seconds: 1);
    // Set animation curve duration for the BottomSheet
    controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //Creating instance for bloc
  DefaultUserAddressBloc defaultUserAddressBloc = DefaultUserAddressBloc();
  StateDataApiFetchBloc stateDataApiFetchBloc = StateDataApiFetchBloc();
  CountryDataApiFetchBloc countryDataApiFetchBloc = CountryDataApiFetchBloc();
  SearchStoreAddressBloc searchStoreAddressBloc = SearchStoreAddressBloc();
  OrderSummaryBloc orderSummaryBloc = OrderSummaryBloc();
  PaymentModuleTansactionBloc paymentModuleTansactionBloc =
      PaymentModuleTansactionBloc();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  //user default address
  DefaultAddressData? defaultAddressData;
  DefaultAddressFieldData? shippingAndBillingAddressSameData;

  String? dropdownValueForCountry;
  String? dropdownValueForState;
  int _paymentModeSelect = -1;
  String? radioBtnValue;
  bool isProgress = false;
  String? grandTotal;
  int count = 0;
  //Controller for search store
  final _searchStore = TextEditingController();
  SearchStore? searchStore;
  Map<String, String> selectedStoreAddress = {"index": "null"};
  bool isSearchStoreProgress = false;
  bool customErrorDialog = false;
  String customErrorMessage = "";
  Timer? timer;

  ShippingAddressEnum? _shippingAddressDetails =
      ShippingAddressEnum.billAddress;

  OrderSummaryData? orderSummaryData;

  //setting values for country drop down button
  CountryList? countryList;
  Country? country;

  //setting values for state dropdown button
  List<StateData>? stateList = [];
  StateData? stateData;

  //setting payment module data
  ViewPaymentModule? viewPaymentModule;
  PaymentModule? paymentModule;

  //Controller for all billing address textfield values
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address1 = TextEditingController();
  final TextEditingController _address2 = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _zip = TextEditingController();

  //Controller for all billing address textfield values
  final TextEditingController _shippingAddressFirstName =
      TextEditingController();
  final TextEditingController _shippingAddressLastName =
      TextEditingController();
  final TextEditingController _shippingAddressEmail = TextEditingController();
  final TextEditingController _shippingAddressPhone = TextEditingController();
  final TextEditingController _shippingAddressAddress1 =
      TextEditingController();
  final TextEditingController _shippingAddressAddress2 =
      TextEditingController();
  final TextEditingController _shippingAddressCity = TextEditingController();
  final TextEditingController _shippingAddressZip = TextEditingController();
  BuildContext? dialogContext;

  void setFormFieldData(
      DefaultBillingAddress editAddressList,
      DefaultShippingAddress defaultShippingAddress,
      bool billingAddressStatus) {
    if (billingAddressStatus) {
      //  print("Setting billling address data ");
      _firstName.text = editAddressList.field_data!.firstname.toString();
      _lastName.text = editAddressList.field_data!.lastname.toString();
      _email.text = editAddressList.field_data!.email.toString();
      _phone.text = editAddressList.field_data!.phone.toString();
      _address1.text = editAddressList.field_data!.address1.toString();
      _address2.text = editAddressList.field_data!.address2.toString();
      _city.text = editAddressList.field_data!.city.toString();
      _zip.text = editAddressList.field_data!.zip.toString();

      country = Country(
          editAddressList.field_data!.country_id!,
          editAddressList.field_data!.country!,
          editAddressList.field_data!.country_code!);
      stateData = StateData(
          editAddressList.field_data!.zone_id!,
          editAddressList.field_data!.country_id!,
          editAddressList.field_data!.zone!);

      stateDataApiFetchBloc.add(LoadStateData(
          countryID: editAddressList.field_data!.country_id.toString(),
          token: widget.token!,
          eventChecker: true));
    } else {
      // print("Setting shipping  address data ");
      _shippingAddressFirstName.text =
          defaultShippingAddress.field_data!.firstname.toString();
      _shippingAddressLastName.text =
          defaultShippingAddress.field_data!.lastname.toString();
      _shippingAddressEmail.text =
          defaultShippingAddress.field_data!.email.toString();
      _shippingAddressPhone.text =
          defaultShippingAddress.field_data!.phone.toString();
      _shippingAddressAddress1.text =
          defaultShippingAddress.field_data!.address1.toString();
      _shippingAddressAddress2.text =
          defaultShippingAddress.field_data!.address2.toString();
      _shippingAddressCity.text =
          defaultShippingAddress.field_data!.city.toString();
      _shippingAddressZip.text =
          defaultShippingAddress.field_data!.zip.toString();

      country = Country(
          defaultShippingAddress.field_data!.country_id!,
          defaultShippingAddress.field_data!.country!,
          defaultShippingAddress.field_data!.country_code!);
      stateData = StateData(
          defaultShippingAddress.field_data!.zone_id!,
          defaultShippingAddress.field_data!.country_id!,
          defaultShippingAddress.field_data!.zone!);

      stateDataApiFetchBloc.add(LoadStateData(
          countryID: defaultShippingAddress.field_data!.country_id.toString(),
          token: widget.token!,
          eventChecker: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => defaultUserAddressBloc
            ..add(LoadUserDefaultAddress(widget.token!)),
        ),
        BlocProvider.value(
          value: stateDataApiFetchBloc,
        ),
        BlocProvider(
          create: (context) => countryDataApiFetchBloc
            ..add(LoadCountryDataFetchApi(widget.token!)),
        ),
        BlocProvider(
            create: (context) =>
                orderSummaryBloc..add(LoadUserOrderSummary(widget.token!))),
        BlocProvider(create: (context) => searchStoreAddressBloc),
        BlocProvider(create: (context) => paymentModuleTansactionBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Stepper(
                      type: StepperType.horizontal,
                      physics: const BouncingScrollPhysics(),
                      currentStep: _currentStep!,

                      // onStepTapped: (step) => tapped(step),
                      // onStepContinue: continued,
                      // onStepCancel: cancel,
                      steps: <Step>[
                        Step(
                          title: const Text(
                            'Address',
                            style: TextStyle(fontSize: 14),
                          ),
                          content: BlocConsumer<DefaultUserAddressBloc,
                              DefaultUserAddressState>(
                            listener: (context, state) {
                              if (state is DefaultUserAddressLoading) {
                                setState(() {
                                  isProgress = true;
                                });
                              }
                              if (state is DefaultUserAddressLoaded) {
                                setState(() {
                                  defaultAddressData = state.defaultAddressData;
                                  setFormFieldData(
                                      defaultAddressData!
                                          .data!.default_billing_address!,
                                      defaultAddressData!
                                          .data!.default_shipping_address!,
                                      true);
                                  isProgress = false;
                                });
                              }
                              if (state is DefaultUserAddressUpdated) {
                                setState(() {
                                  isProgress = false;
                                  shippingAndBillingAddressSameData =
                                      state.addressFieldData;
                                });
                                shippingAddressSelectModal(context);
                              }
                              if (state is DefaultUserAddressNotFound) {
                                setState(() {
                                  isProgress = false;
                                });
                              }
                              if (state is DefaultUserAddressFailure) {
                                setState(() {
                                  isProgress = false;
                                });
                              }
                              if (state is DefaultUserAddressUpdateFailure) {
                                setState(() {
                                  isProgress = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    defaultSnackBar(state.message, Colors.red,
                                        Colors.white, 2000));
                              }
                            },
                            builder: (context, state) {
                              if (state is DefaultUserAddressLoading) {
                                return Container();
                              }
                              if (state is DefaultUserAddressFailure) {
                                return SizedBox(
                                  height: SizeConfig.screenHeight! * 0.6,
                                  child: Center(
                                    child: Text(state.message),
                                  ),
                                );
                              }
                              return _buildAddressForm(context);
                            },
                          ),
                          isActive: _currentStep! >= 0,
                          state: _currentStep! >= 0
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: const FittedBox(
                              child: Text(
                            'Order',
                            style: TextStyle(fontSize: 14),
                          )),
                          content: Column(
                            children: [
                              Column(
                                children: <Widget>[
                                  //Product List
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: widget.cartProductData!.length,
                                      itemBuilder: (context, index) {
                                        CartProductData cartProductData =
                                            widget.cartProductData![index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Card(
                                            margin: EdgeInsets.zero,
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      getProportionateScreenWidth(
                                                                          5.0)),
                                                              height:
                                                                  getProportionateScreenHeight(
                                                                      100.0),
                                                              width:
                                                                  getProportionateScreenWidth(
                                                                      100.0),
                                                              // decoration: BoxDecoration(
                                                              //     border: Border.all(color: kDefaultBorderColor)),
                                                              child: CachedNetworkImage(
                                                                  width:
                                                                      getProportionateScreenWidth(
                                                                          250.0),
                                                                  height:
                                                                      getProportionateScreenHeight(
                                                                          250.0),
                                                                  imageUrl:
                                                                      "$categoryImageUrl/product/medium/${ImagePath.getPrimaryImageSrc(widget.cartProductData![index].images!)}",
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      Container(),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const Image(
                                                                          image:
                                                                              AssetImage(errorImageUrl))),
                                                            ),

                                                            const SizedBox(
                                                              height: 10,
                                                            ), //Quantity
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 7,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    getProportionateScreenWidth(
                                                                        10.0),
                                                                vertical: 5.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              cartProductData
                                                                      .name ??
                                                                  " ",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      getProportionateScreenWidth(
                                                                          15.0),
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .onBackground,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  height: 1.5),
                                                            ),

                                                            //Price Tag
                                                            SizedBox(
                                                              height:
                                                                  getProportionateScreenHeight(
                                                                      15.0),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Qty",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onBackground,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10.0,
                                                                ),
                                                                Text(
                                                                  cartProductData
                                                                      .item_quantity
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onBackground
                                                                          .withOpacity(
                                                                              0.8),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  getProportionateScreenHeight(
                                                                      15.0),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onBackground,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10.0,
                                                                ),
                                                                PriceTag(
                                                                  price: cartProductData
                                                                      .price!
                                                                      .floor()
                                                                      .toString(),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            //Sub-Total
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Sub-Total",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onBackground,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                const SizedBox(
                                                                  width: 10.0,
                                                                ),
                                                                PriceTag(
                                                                  price: (cartProductData
                                                                              .item_quantity! *
                                                                          cartProductData
                                                                              .price!)
                                                                      .floor()
                                                                      .toString(),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  //Grand Total
                                  BlocListener<OrderSummaryBloc,
                                      OrderSummaryState>(
                                    listener: (context, state) {
                                      if (state is OrderSummaryLoaded) {
                                        setState(() {
                                          orderSummaryData =
                                              state.orderSummaryData;
                                        });
                                        orderSummaryBloc.add(
                                            LoadUserCheckoutTotalProduct(
                                                widget.token!));
                                      }
                                      if (state
                                          is OrderSummaryCheckoutUserTotal) {
                                        if (orderSummaryData!
                                                .data.gst_applicable ==
                                            "1") {
                                          setState(() {
                                            grandTotal =
                                                (state.userCheckoutTotal[
                                                            "order_value"] *
                                                        1.18)
                                                    .floor()
                                                    .toString();
                                            // print(
                                            //     "total:${state.userCheckoutTotal["order_value"]}     gst: $grandTotal");
                                          });
                                        } else {
                                          setState(() {
                                            grandTotal = state
                                                .userCheckoutTotal[
                                                    "order_value"]
                                                .toString();
                                            // print(
                                            //     "total:${state.userCheckoutTotal["order_value"]}     gst: $grandTotal");
                                          });
                                        }
                                      }
                                    },
                                    child: BlocBuilder<OrderSummaryBloc,
                                        OrderSummaryState>(
                                      builder: (context, state) {
                                        //    print(orderSummaryBloc.state);
                                        if (state
                                            is OrderSummaryCheckoutUserTotal) {
                                          return Card(
                                            margin: EdgeInsets.zero,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text("Grand Total :",
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onBackground,
                                                          )),
                                                      const Spacer(),
                                                      PriceTag(
                                                        price: grandTotal ?? "",
                                                        fontSize: 16.0,
                                                        priceSuffixFontSize:
                                                            13.0,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            5.0),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Text(
                                                      "(*Inclusive of all taxes)",
                                                      style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                12.0),
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                            .withOpacity(0.8),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            15.0),
                                                  ),
                                                  Divider(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .outline,
                                                    thickness: 1,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            5.0),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      text:
                                                          'By submitting your order, you agree to the',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        height: 1.5,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                            .withOpacity(0.8),
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                ' Terms & Conditions',
                                                            style: TextStyle(
                                                                fontSize: 14.0,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .tertiary),
                                                            recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap =
                                                                      () {}),
                                                        TextSpan(
                                                          text: ' and ',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onBackground
                                                                .withOpacity(
                                                                    0.8),
                                                          ),
                                                        ),
                                                        TextSpan(
                                                            text:
                                                                'Privacy Policy',
                                                            style: TextStyle(
                                                                fontSize: 14.0,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .tertiary),
                                                            recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap =
                                                                      () {}),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            10.0),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Icon(
                                                        Icons.info_sharp,
                                                        size:
                                                            getProportionateScreenHeight(
                                                                20.0),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            getProportionateScreenWidth(
                                                                5.0),
                                                      ),
                                                      Text(
                                                        "Need any help?",
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .onBackground
                                                              .withOpacity(0.9),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            10.0),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Speak to Our e-commerce specialist :",
                                                        style: TextStyle(
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  12.0),
                                                          color: Theme.of(
                                                                  context)
                                                              .colorScheme
                                                              .onBackground
                                                              .withOpacity(0.9),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            getProportionateScreenWidth(
                                                                5),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.phone_sharp,
                                                            size: 12,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .tertiary,
                                                          ),
                                                          Text("1800267788",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .tertiary)),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        getProportionateScreenHeight(
                                                            10.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: SizeConfig.screenWidth! * 30,
                                      margin: EdgeInsets.only(
                                          left: SizeConfig.screenWidth! * 0.60),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            paymentModuleTansactionBloc.add(
                                                LoadPaymentModuleDetails(
                                                    widget.token!));
                                            continued();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          child: const Text("NEXT")))
                                ],
                              ),
                            ],
                          ),
                          isActive: _currentStep! >= 0,
                          state: _currentStep! >= 1
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: const Text(
                            'Payment',
                            style: TextStyle(fontSize: 14),
                          ),
                          content: BlocConsumer<PaymentModuleTansactionBloc,
                              PaymentModuleTansactionState>(
                            listener: (context, state) {
                              if (state is PaymentModuleTansactionLoading) {
                                setState(() {
                                  isProgress = true;
                                });
                              }
                              if (state is PaymentModuleTansactionLoaded) {
                                setState(() {
                                  viewPaymentModule = state.viewPaymentModule;
                                  isProgress = false;
                                });
                              }
                              if (state
                                  is PaymentModuleTansactionRedirectURLLoaded) {
                                setState(() {
                                  paymentModule = state.paymentModule;
                                });
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PaymentScreen(
                                    url: paymentModule!.data!.payment_link ??
                                        " ",
                                    orderId:
                                        paymentModule!.data!.order_id ?? " ",
                                    token: widget.token ?? " ",
                                  );
                                }));
                              }
                              if (state
                                  is PaymentModuleTansactionCashOnDeliverySuccess) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => PaymentSuccess(
                                              order_id: paymentModule!
                                                      .data!.order_id ??
                                                  " ",
                                              token: widget.token ?? " ",
                                            ))));
                              }
                              if (state
                                  is PaymentModuleTansactionRedirectURLFailure) {
                                setState(() {
                                  isProgress = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    defaultSnackBar(state.message, Colors.red,
                                        Colors.white, 2000));
                              }
                              if (state is PaymentModuleTansactionFailure) {
                                setState(() {
                                  isProgress = false;
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state is PaymentModuleTansactionFailure) {
                                return SizedBox(
                                  height: SizeConfig.screenHeight! * 0.6,
                                  child: Center(
                                    child: Text(
                                      state.message,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }
                              if (state is PaymentModuleTansactionLoaded) {
                                return _buildPaymentModule();
                              }
                              if (state
                                  is PaymentModuleTansactionRedirectURLLoaded) {
                                paymentModule = state.paymentModule;
                                return _buildPaymentModule();
                              }
                              if (state
                                  is PaymentModuleTansactionCashOnDeliverySuccess) {
                                paymentModule = state.paymentModule;
                                return _buildPaymentModule();
                              }
                              if (state
                                  is PaymentModuleTansactionRedirectURLFailure) {
                                return _buildPaymentModule();
                              }
                              return Container();
                            },
                          ),
                          isActive: _currentStep! >= 0,
                          state: _currentStep! >= 2
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                      ],
                      controlsBuilder:
                          (BuildContext context, ControlsDetails details) {
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
              (isProgress && _currentStep != 1)
                  ? Transform.translate(
                      offset: const Offset(0, 73),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.transparent,
                      ))
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildPaymentModule() {
    return Column(
      children: [
        ListView.builder(
            itemCount: viewPaymentModule!.data!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                child: Material(
                  color: Colors.transparent,
                  child: CheckboxListTile(
                    dense: true,
                    value: _paymentModeSelect == index,
                    selectedTileColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    // activeColor: Colors.blue,
                    selected: _paymentModeSelect == index,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: kDefaultBorderColor, width: 1),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    title: Text(
                      viewPaymentModule!.data![index].pg_name ?? "",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) {
                      setState(() {
                        _paymentModeSelect = index;
                      });
                    },
                  ),
                ),
              );
            }),
        const SizedBox(
          height: 10.0,
        ),
        Container(
            width: SizeConfig.screenWidth! * 30,
            margin: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.60),
            child: ElevatedButton(
                onPressed: () {
                  ViewPaymentModuleData viewPaymentModuleData =
                      ViewPaymentModuleData(
                          viewPaymentModule!.data![_paymentModeSelect].p_id,
                          viewPaymentModule!.data![_paymentModeSelect].pg_name,
                          viewPaymentModule!.data![_paymentModeSelect].c_id,
                          viewPaymentModule!
                              .data![_paymentModeSelect].client_name);

                  paymentModuleTansactionBloc.add(
                      LoadParticularPaymentModuleData(
                          widget.token ?? " ", viewPaymentModuleData));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary),
                child: const Text("NEXT")))
      ],
    );
  }

  //This is for billing address form input
  Widget _buildAddressForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            "Billing Address",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20.0),
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.8)),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //First Name
          TextInputFieldForCheckout(
            title: "First Name",
            validator: isEmpty,
            controller: _firstName,
            isMandatory: true,
            obscureText: false,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //Last Name
          TextInputFieldForCheckout(
            title: "Last Name",
            validator: isEmpty,
            controller: _lastName,
            isMandatory: true,
            obscureText: false,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //Email
          TextInputFieldForCheckout(
            title: "E-mail",
            validator: isEmpty,
            controller: _email,
            isMandatory: true,
            obscureText: false,
          ),

          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //Phone No
          TextInputFieldForCheckout(
            title: "Phone No.",
            validator: isEmpty,
            textInputType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              // LengthLimitingTextInputFormatter(
              //   2,
              // ),
            ],
            controller: _phone,
            isMandatory: true,
            obscureText: false,
          ),

          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //Address 1
          TextInputFieldForCheckout(
            title: "Address 1",
            validator: isEmpty,
            controller: _address1,
            isMandatory: true,
            obscureText: false,
          ),

          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //Address 2
          TextInputFieldForCheckout(
            title: "Address 2",
            validator: isEmpty,
            controller: _address2,
            isMandatory: false,
            obscureText: false,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //City
          TextInputFieldForCheckout(
            title: "City",
            validator: isEmpty,
            controller: _city,
            isMandatory: true,
            obscureText: false,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //Zip
          TextInputFieldForCheckout(
            title: "Post Code",
            validator: isEmpty,
            textInputType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: true,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              // LengthLimitingTextInputFormatter(
              //   2,
              // ),
            ],
            controller: _zip,
            isMandatory: true,
            obscureText: false,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //Country
          BlocBuilder<CountryDataApiFetchBloc, CountryDataApiFetchState>(
            builder: (context, state) {
              if (state is CountryDataApiFetchLoded) {
                countryList = state.countryList;
                return _buildCountryDropDown();
              }
              return Container();
            },
          ),

          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),

          //State
          BlocConsumer<StateDataApiFetchBloc, StateDataApiFetchState>(
            listener: (context, state) {
              if (state is StateDataApiFetchLoaded) {
                setState(() {
                  if (state.eventChecker) {
                  } else {
                    stateData = null;
                  }
                  stateList = state.stateList.state;
                });
              }
            },
            builder: (context, state) {
              if (state is StateDataApiFetchLoaded) {
                stateList = state.stateList.state;
              }
              return _buildStateDropDown();
            },
          ),

          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),
          Container(
              width: SizeConfig.screenWidth! * 30,
              margin: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.60),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      DefaultAddressFieldData defaultAddressFieldData =
                          DefaultAddressFieldData(
                              firstname: _firstName.text,
                              lastname: _lastName.text,
                              email: _email.text,
                              phone: int.parse(_phone.text),
                              address1: _address1.text,
                              address2: _address2.text,
                              city: _city.text,
                              zip: int.parse(_zip.text),
                              country: country!.name,
                              country_code: country!.isoCode2,
                              country_id: country!.id,
                              zone: stateData!.name,
                              zone_id: stateData!.id);
                      //   print(defaultAddressFieldData);

                      defaultUserAddressBloc.add(UpdateDefaultBillingAddress(
                          defaultAddressFieldData, widget.token!));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary),
                  child: const Text("NEXT")))
        ],
      ),
    );
  }

  //This is dropdown for state
  Widget _buildStateDropDown() {
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
          height: 40.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3.0)),
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.outline)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<StateData>(
                // Initial Value
                value: stateData,
                isDense: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.54),
                ),
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontSize: 16.0),
                isExpanded: true,
                hint: Text("Select state",
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.6),
                        fontSize: getProportionateScreenWidth(15.0))),
                items: stateList!.map((StateData state) {
                  return DropdownMenuItem(
                    value: state,
                    child: Text(state.name),
                  );
                }).toList(),
                onChanged: (StateData? newValue) {
                  setState(() {
                    stateData = newValue;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  //dropdown for country
  Widget _buildCountryDropDown() {
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
          height: 40.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3.0)),
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.outline)),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<Country>(
                // Initial Value
                value: country,

                isDense: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.54),
                ),
                style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8),
                    fontSize: 16.0),

                isExpanded: true,
                hint: Text("Select country",
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.6),
                        fontSize: getProportionateScreenWidth(15.0))),
                items: countryList!.country!.map((Country items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items.name),
                  );
                }).toList(),
                onChanged: (Country? newValue) {
                  setState(() {
                    country = newValue;
                  });

                  stateDataApiFetchBloc.add(LoadStateData(
                      countryID: newValue!.id.toString(),
                      token: widget.token!,
                      eventChecker: false));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  //bottom modal sheet for select shipping address
  Future<void> shippingAddressSelectModal(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      transitionAnimationController: controller,
      builder: (BuildContext context) {
        dialogContext = context;
        return StatefulBuilder(builder: (context, setterState) {
          return BlocProvider.value(
            value: defaultUserAddressBloc,
            child:
                BlocConsumer<DefaultUserAddressBloc, DefaultUserAddressState>(
              listener: (context, state) {
                if (state is DefaultUserBillingAndShippingAddressSameUpdated) {
                  Navigator.pop(context);

                  checkoutAddShippingInfoAnalyticsEvent();
                  continued();
                }
              },
              builder: (context, state) {
                if (state is DefaultUserBillingAndShippingAddressSameLoading) {
                  return Container(
                    height: 300,
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.screenHeight! * 0.05),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5.0,
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                }
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(15.0),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Shipping Address / Store Pickup",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(20.0),
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15.0),
                      ),
                      Material(
                        color: Theme.of(context).colorScheme.background,
                        child: RadioListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          value: ShippingAddressEnum.billAddress,
                          groupValue: _shippingAddressDetails,
                          dense: true,
                          selected: true,
                          activeColor: Theme.of(context).colorScheme.primary,
                          onChanged: (ShippingAddressEnum? value) {
                            setterState(() {
                              _shippingAddressDetails = value;
                            });
                          },
                          title: Text(
                            'Ship to billing address',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(15.0),
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.8)),
                          ),
                        ),
                      ),
                      Material(
                        color: Theme.of(context).colorScheme.background,
                        child: RadioListTile(
                          dense: true,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          value: ShippingAddressEnum.nearestUnicornStoreAddress,
                          activeColor: Theme.of(context).colorScheme.primary,
                          groupValue: _shippingAddressDetails,
                          onChanged: (ShippingAddressEnum? value) {
                            setterState(() {
                              _shippingAddressDetails = value;

                              //  print(value);
                            });
                          },
                          title: Text(
                            'Ship to your nearest Unicorn store',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(15.0),
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.8)),
                          ),
                        ),
                      ),
                      Material(
                        color: Theme.of(context).colorScheme.background,
                        child: RadioListTile(
                            dense: true,
                            value: ShippingAddressEnum.newAddress,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            groupValue: _shippingAddressDetails,
                            activeColor: Theme.of(context).colorScheme.primary,
                            title: Text(
                              'Enter a new address',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15.0),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.8)),
                            ),
                            onChanged: (ShippingAddressEnum? value) {
                              setterState(() {
                                _shippingAddressDetails = value;
                              });
                            }),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15.0),
                      ),
                      Row(
                        children: <Widget>[
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              child: const Text("CANCEL")),
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                switch (_shippingAddressDetails) {
                                  case ShippingAddressEnum
                                      .nearestUnicornStoreAddress:
                                    _searchStoreDialog();
                                    break;
                                  case ShippingAddressEnum.billAddress:
                                    defaultUserAddressBloc.add(
                                        UpdateDefaultShippingAddress(
                                            shippingAndBillingAddressSameData!,
                                            widget.token!,
                                            true));

                                    break;
                                  case ShippingAddressEnum.newAddress:
                                    _newShippingAddressDialog();
                                    break;
                                  default:
                                }
                                // if (_shippingAddressDetails ==
                                //     ShippingAddressEnum.nearestUnicornStoreAddress) {
                                //   _searchStoreDialog();
                                // } else {
                                //   FocusScope.of(context).unfocus();
                                //   Navigator.pop(context);
                                //   continued();
                                // }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              child: const Text("NEXT")),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
      },
    ).whenComplete(() {
      defaultUserAddressBloc.add(LoadUserDefaultAddress(widget.token!));
    });
  }

  //Dialog for search and select shipping store
  Future<void> _searchStoreDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: searchStoreAddressBloc
            ..add(LoadStoreAddress(" ", widget.token!)),
          child: StatefulBuilder(builder: (context, settingState) {
            return Stack(
              children: [
                AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    insetPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    contentPadding: const EdgeInsets.all(0.0),
                    title: Row(
                      children: [
                        Text(
                          'Search Store',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            _searchStore.clear();
                            log("Closing");
                            if (timer != null) {
                              if (timer!.isActive) {
                                settingState(() {
                                  customErrorDialog = false;
                                  customErrorMessage = "";
                                });
                                timer!.cancel();
                              }
                            }
                            Navigator.of(context).pop();
                          },
                          padding: const EdgeInsets.all(0.0),
                          iconSize: 35.0,
                          icon: const Icon(
                            Icons.cancel_rounded,
                          ),
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.4),
                        ),
                      ],
                    ),
                    actions: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    //  print(selectedStoreAddress["index"]!);
                                    if (selectedStoreAddress["index"] !=
                                        "null") {
                                      searchStoreAddressBloc.add(
                                          UpdateShippingStoreAddress(
                                              selectedStoreAddress["index"]!,
                                              widget.token!));
                                    } else {
                                      settingState(() {
                                        customErrorDialog = true;
                                        customErrorMessage =
                                            "Please select store address";
                                      });

                                      timer =
                                          Timer(const Duration(seconds: 2), () {
                                        settingState(() {
                                          customErrorDialog = false;
                                          customErrorMessage = "";
                                        });
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  child: const Text("Continue")),
                            ),
                          ),
                          (customErrorDialog)
                              ? Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0))),
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    customErrorMessage,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onError,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ))
                              : Container()
                        ],
                      )
                    ],
                    content: SizedBox(
                      // color: Colors.red,
                      height: SizeConfig.screenHeight! * 0.7,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          // const Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 25.0),
                          //   child: Text(
                          //     'Search Store',
                          //     style: TextStyle(
                          //         fontSize: 24.0,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black87),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 15.0,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              height: 45.0,
                              //  padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  // color: Colors.black.withOpacity(0.1),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: TextFormField(
                                controller: _searchStore,
                                textInputAction: TextInputAction.search,
                                style: const TextStyle(fontSize: 16.0),
                                onFieldSubmitted: (value) {
                                  searchStoreAddressBloc.add(LoadStoreAddress(
                                      _searchStore.text, widget.token!));
                                },
                                cursorColor:
                                    Theme.of(context).colorScheme.primary,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 10.0),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          searchStoreAddressBloc.add(
                                              LoadStoreAddress(
                                                  _searchStore.text,
                                                  widget.token!));
                                        },
                                        icon: const Icon(Icons.search)),
                                    hintStyle: const TextStyle(fontSize: 16.0),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .outline),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5.0))),
                                    // border: OutlineInputBorder(
                                    //     borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
                                    //     borderRadius: const BorderRadius.all(Radius.circular(5.0))),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5.0)),
                                    ),
                                    hintText: "City"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          BlocListener<SearchStoreAddressBloc,
                              SearchStoreAddressState>(
                            listener: (context, state) {
                              if (state is SearchStoreAddressUpdateLoading) {
                                settingState(() {
                                  isSearchStoreProgress = true;
                                });
                              }

                              if (state is SearchStoreAddressLoaded) {
                                settingState(() {
                                  searchStore = state.searchStore;
                                  selectedStoreAddress["index"] = "null";
                                });
                              }
                              if (state is SearchStoreAddressUpdated) {
                                settingState(() {
                                  isSearchStoreProgress = false;
                                });
                                continued();
                                checkoutAddShippingInfoAnalyticsEvent();
                                Navigator.pop(context);
                                Navigator.pop(dialogContext!);

                                // Navigator.of(context)
                                //     .popUntil((_) => count++ >= 2);

                                // Navigator.popUntil(
                                //     context,
                                //     ModalRoute.withName(
                                //         '/CheckoutPage_Screen'));

                                // Navigator.popUntil(
                                //     context,
                                //     (route) =>
                                //         route.settings.name ==
                                //         "/CheckoutPage_Screen");
                              }
                              if (state is SearchStoreAddressUpdateFailure) {
                                settingState(() {
                                  isSearchStoreProgress = false;
                                  customErrorDialog = true;
                                  customErrorMessage = state.message;
                                });
                                timer = Timer(const Duration(seconds: 3), () {
                                  settingState(() {
                                    isSearchStoreProgress = false;
                                    customErrorDialog = false;
                                    customErrorMessage = "";
                                  });
                                });
                              }
                            },
                            child: BlocBuilder<SearchStoreAddressBloc,
                                SearchStoreAddressState>(
                              builder: (context, state) {
                                if (state is SearchStoreAddressLoading) {
                                  return Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              SizeConfig.screenHeight! * 0.05),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 5.0,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                if (state is SearchStoreAddressLoaded) {
                                  searchStore = state.searchStore;
                                  return Flexible(
                                      child: ListView.builder(
                                          itemCount: searchStore!.data!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: SelectableContainer(
                                                  padding: 10.0,
                                                  borderRadius: 7,
                                                  selected: (selectedStoreAddress["index"] ==
                                                          searchStore!
                                                              .data![index]
                                                              .store_id!)
                                                      ? true
                                                      : false,
                                                  marginColor: Colors.white,
                                                  onValueChanged: (_) {
                                                    settingState(() {
                                                      selectedStoreAddress[
                                                              "index"] =
                                                          searchStore!
                                                              .data![index]
                                                              .store_id!;
                                                    });
                                                  },
                                                  selectedBorderColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                  unselectedBorderColor:
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .outline,
                                                  selectedBackgroundColorIcon:
                                                      Theme.of(context)
                                                          .dialogBackgroundColor,
                                                  unselectedBackgroundColorIcon:
                                                      Theme.of(context)
                                                          .dialogBackgroundColor,
                                                  unselectedOpacity: 0.8,
                                                  unselectedIcon: Icons
                                                      .check_circle_outline_rounded,
                                                  icon: Icons
                                                      .check_circle_rounded,
                                                  iconAlignment:
                                                      Alignment.topRight,
                                                  iconSize: 24,
                                                  iconColor: selectedStoreAddress["index"] ==
                                                          searchStore!.data![index].store_id!
                                                      ? Theme.of(context).colorScheme.secondary
                                                      : Theme.of(context).colorScheme.outline,
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          searchStore!
                                                                  .data![index]
                                                                  .store_name ??
                                                              " ",
                                                          style: TextStyle(
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.8)),
                                                        ),
                                                        const SizedBox(
                                                          height: 5.0,
                                                        ),
                                                        Text(
                                                            searchStore!
                                                                    .data![
                                                                        index]
                                                                    .store_address ??
                                                                " ",
                                                            style: TextStyle(
                                                                fontSize: 14.0,
                                                                height: 1.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onBackground
                                                                    .withOpacity(
                                                                        0.8))),
                                                        const SizedBox(
                                                          height: 2.0,
                                                        ),
                                                        Text(
                                                          "Phone No- ${searchStore!.data![index].store_contacts}",
                                                          style: TextStyle(
                                                              fontSize: 14.0,
                                                              height: 1.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onBackground
                                                                  .withOpacity(
                                                                      0.8)),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            );
                                          }));
                                }
                                if (state is SearchStoreAddressFailure) {
                                  return Expanded(
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        state.message,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                  );
                                }
                                return Container();
                              },
                            ),
                          )
                        ],
                      ),
                    )),
                (isSearchStoreProgress)
                    ? Container(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.3),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5.0,
                            color: Theme.of(context).colorScheme.primary,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          }),
        );
      },
    );
  }

  //Dialog for select new shipping address
  Future<void> _newShippingAddressDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: searchStoreAddressBloc
                ..add(LoadStoreAddress(" ", widget.token!)),
            ),
            BlocProvider.value(
              value: defaultUserAddressBloc
                ..add(LoadUserDefaultAddress(widget.token!)),
            ),
            BlocProvider.value(
              value: stateDataApiFetchBloc,
            ),
            BlocProvider.value(value: countryDataApiFetchBloc),
          ],
          child: StatefulBuilder(builder: (context, settingState) {
            return Stack(
              children: [
                AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    insetPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    contentPadding: const EdgeInsets.all(0.0),
                    title: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.8)),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              if (timer != null) {
                                if (timer!.isActive) {
                                  settingState(() {
                                    customErrorDialog = false;
                                    customErrorMessage = "";
                                  });
                                  timer!.cancel();
                                }
                              }
                              Navigator.of(context).pop();
                              //This is event to resolve issues when we change coutry and close aleart dialod then open again
                              stateDataApiFetchBloc.add(LoadStateData(
                                  countryID: defaultAddressData!
                                      .data!
                                      .default_shipping_address!
                                      .field_data!
                                      .country_id
                                      .toString(),
                                  token: widget.token!,
                                  eventChecker: false));
                            },
                            padding: const EdgeInsets.all(0.0),
                            iconSize: 35.0,
                            icon: const Icon(
                              Icons.cancel_rounded,
                            ),
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    DefaultAddressFieldData
                                        defaultAddressFieldData =
                                        DefaultAddressFieldData(
                                            firstname:
                                                _shippingAddressFirstName.text,
                                            lastname:
                                                _shippingAddressLastName.text,
                                            email: _shippingAddressEmail.text,
                                            phone: int.parse(
                                                _shippingAddressPhone.text),
                                            address1:
                                                _shippingAddressAddress1.text,
                                            address2:
                                                _shippingAddressAddress2.text,
                                            city: _shippingAddressCity.text,
                                            zip: int.parse(
                                                _shippingAddressZip.text),
                                            country: country!.name,
                                            country_code: country!.isoCode2,
                                            country_id: country!.id,
                                            zone: stateData!.name,
                                            zone_id: stateData!.id);
                                    //  print(defaultAddressFieldData);
                                    defaultUserAddressBloc.add(
                                        UpdateDefaultShippingAddress(
                                            defaultAddressFieldData,
                                            widget.token!,
                                            false));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  child: const Text("Continue")),
                            ),
                          ),
                          (customErrorDialog)
                              ? Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20.0))),
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    customErrorMessage,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onError,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ))
                              : Container(),
                        ],
                      )
                    ],
                    content: BlocConsumer<DefaultUserAddressBloc,
                        DefaultUserAddressState>(
                      listener: (context, state) {
                        if (state is DefaultUserAddressLoaded) {
                          settingState(() {
                            defaultAddressData = state.defaultAddressData;
                            //  print(defaultAddressData);
                            setFormFieldData(
                                defaultAddressData!
                                    .data!.default_billing_address!,
                                defaultAddressData!
                                    .data!.default_shipping_address!,
                                false);
                          });
                        }
                        if (state is DefaultUserShippingAddressUpdateLoading) {
                          settingState(() {
                            isSearchStoreProgress = true;
                          });
                        }
                        if (state is DefaultUserShippingAddressUpdated) {
                          settingState(() {
                            isSearchStoreProgress = false;
                          });
                          // Navigator.popUntil(context,
                          //     ModalRoute.withName('/CheckoutPage_Screen'));
                          // Navigator.popUntil(
                          //     context,
                          //     (route) =>
                          //         route.settings.name ==
                          //         "/CheckoutPage_Screen");
                          continued();
                          checkoutAddShippingInfoAnalyticsEvent();
                          Navigator.pop(context);
                          Navigator.pop(dialogContext!);
                          // Navigator.of(context).popUntil((_) => count++ >= 2);
                        }
                        if (state is DefaultUserAddressNotFound) {
                          setState(() {
                            isProgress = false;
                          });
                        }
                        if (state is DefaultUserShippingAddressUpdateFailure) {
                          settingState(() {
                            isSearchStoreProgress = false;
                            customErrorDialog = true;
                            customErrorMessage = state.message;
                          });
                          timer = Timer(const Duration(seconds: 3), () {
                            settingState(() {
                              isSearchStoreProgress = false;
                              customErrorDialog = false;
                              customErrorMessage = "";
                            });
                          });
                        }
                      },
                      builder: (context, state) {
                        if (state is DefaultUserAddressLoading) {
                          return Container(
                            height: SizeConfig.screenHeight! * 0.7,
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.screenHeight! * 0.05),
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 5.0,
                                color: Theme.of(context).colorScheme.primary,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          );
                        }
                        if (state is DefaultUserAddressLoaded) {
                          defaultAddressData = state.defaultAddressData;
                        }
                        return Container(
                          // color: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          height: SizeConfig.screenHeight! * 0.7,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            children: <Widget>[
                              //First Name
                              TextInputFieldForCheckout(
                                title: "First Name",
                                controller: _shippingAddressFirstName,
                                isMandatory: true,
                                obscureText: false,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //Last Name
                              TextInputFieldForCheckout(
                                title: "Last Name",
                                controller: _shippingAddressLastName,
                                isMandatory: true,
                                obscureText: false,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //Email
                              TextInputFieldForCheckout(
                                title: "E-mail",
                                controller: _shippingAddressEmail,
                                isMandatory: true,
                                obscureText: false,
                              ),

                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //Phone No
                              TextInputFieldForCheckout(
                                title: "Phone No.",
                                controller: _shippingAddressPhone,
                                isMandatory: true,
                                obscureText: false,
                              ),

                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //Address 1
                              TextInputFieldForCheckout(
                                title: "Address 1",
                                controller: _shippingAddressAddress1,
                                isMandatory: true,
                                obscureText: false,
                              ),

                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //Address 2
                              TextInputFieldForCheckout(
                                title: "Address 2",
                                controller: _shippingAddressAddress2,
                                isMandatory: false,
                                obscureText: false,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //City
                              TextInputFieldForCheckout(
                                title: "City",
                                controller: _shippingAddressCity,
                                isMandatory: true,
                                obscureText: false,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //Zip
                              TextInputFieldForCheckout(
                                title: "Post Code",
                                controller: _shippingAddressZip,
                                isMandatory: true,
                                obscureText: false,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //Country
                              BlocBuilder<CountryDataApiFetchBloc,
                                  CountryDataApiFetchState>(
                                builder: (context, state) {
                                  if (state is CountryDataApiFetchLoded) {
                                    countryList = state.countryList;
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Text(
                                              "Country",
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          15.0)),
                                            ),
                                            const Positioned(
                                              right: -7,
                                              top: -4,
                                              child: Text("*"),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(5.0),
                                        ),
                                        Container(
                                          height: 40.0,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(3.0)),
                                              border: Border.all(
                                                  width: 1,
                                                  color: kDefaultBorderColor)),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<Country>(
                                                // Initial Value
                                                value: country,

                                                isDense: true,
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                      .withOpacity(0.54),
                                                ),
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onBackground
                                                        .withOpacity(0.8),
                                                    fontSize: 16.0),

                                                isExpanded: true,
                                                hint: Text("Select country",
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onBackground
                                                            .withOpacity(0.6),
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                15.0))),
                                                items: countryList!.country!
                                                    .map((Country items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Text(items.name),
                                                  );
                                                }).toList(),
                                                onChanged: (Country? newValue) {
                                                  settingState(() {
                                                    country = newValue;
                                                  });

                                                  stateDataApiFetchBloc.add(
                                                      LoadStateData(
                                                          countryID: newValue!
                                                              .id
                                                              .toString(),
                                                          token: widget.token!,
                                                          eventChecker: false));
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Container();
                                },
                              ),

                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),

                              //State
                              BlocConsumer<StateDataApiFetchBloc,
                                  StateDataApiFetchState>(
                                listener: (context, state) {
                                  if (state is StateDataApiFetchLoaded) {
                                    setState(() {
                                      if (state.eventChecker) {
                                      } else {
                                        stateData = null;
                                      }
                                      stateList = state.stateList.state;
                                    });
                                  }
                                },
                                builder: (context, state) {
                                  if (state is StateDataApiFetchLoaded) {
                                    stateList = state.stateList.state;
                                  }
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            "State",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        15.0)),
                                          ),
                                          const Positioned(
                                            right: -7,
                                            top: -4,
                                            child: Text("*"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(5.0),
                                      ),
                                      Container(
                                        height: 40.0,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(3.0)),
                                            border: Border.all(
                                                width: 1,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline)),
                                        child: DropdownButtonHideUnderline(
                                          child: ButtonTheme(
                                            alignedDropdown: true,
                                            child: DropdownButton<StateData>(
                                              // Initial Value
                                              value: stateData,
                                              isDense: true,
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground
                                                    .withOpacity(0.54),
                                              ),
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onBackground
                                                      .withOpacity(0.8),
                                                  fontSize: 16.0),

                                              isExpanded: true,
                                              hint: Text("Select state",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onBackground
                                                          .withOpacity(0.6),
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              15.0))),
                                              items: stateList!
                                                  .map((StateData state) {
                                                return DropdownMenuItem(
                                                  value: state,
                                                  child: Text(state.name),
                                                );
                                              }).toList(),
                                              onChanged: (StateData? newValue) {
                                                settingState(() {
                                                  stateData = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),

                              SizedBox(
                                height: getProportionateScreenHeight(15.0),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
                (isSearchStoreProgress)
                    ? Container(
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(0.2),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5.0,
                            color: Theme.of(context).colorScheme.primary,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          }),
        );
      },
    );
  }

  // tapped(int step) {
  //   setState(() => _currentStep = step);
  // }

  continued() {
    _currentStep! < 2 ? setState(() => _currentStep = _currentStep! + 1) : null;
  }

  cancel() {
    _currentStep! > 0 ? setState(() => _currentStep = _currentStep! - 1) : null;
  }

  //Google analytics event
  Future<void> checkoutProcessBeginAnalyticsEvent() async {
    List<AnalyticsEventItem> analyticsEvent = [];

    for (var element in widget.cartProductData!) {
      analyticsEvent.add(AnalyticsEventItem(
          itemName: element.name,
          itemId: element.cart_item_id.toString(),
          quantity: element.quantity,
          price: element.saleprice));
    }
    await analytics.logBeginCheckout(items: analyticsEvent).then((value) =>
        print("Analytics checkout process begin Event added successfully"));
  }

  Future<void> checkoutAddShippingInfoAnalyticsEvent() async {
    List<AnalyticsEventItem> analyticsEvent = [];

    for (var element in widget.cartProductData!) {
      analyticsEvent.add(AnalyticsEventItem(
          itemName: element.name,
          itemId: element.cart_item_id.toString(),
          quantity: element.quantity,
          price: element.saleprice));
    }
    await analytics
        .logAddShippingInfo(
            items: analyticsEvent, shippingTier: "Ground", currency: "RUPEES")
        .then((value) =>
            print("Analytics shipping info adding Event added successfully"));
  }

  Future<void> checkoutAddPaymentInfoAnalyticsEvent() async {
    List<AnalyticsEventItem> analyticsEvent = [];

    for (var element in widget.cartProductData!) {
      analyticsEvent.add(AnalyticsEventItem(
          itemName: element.name,
          itemId: element.cart_item_id.toString(),
          quantity: element.quantity,
          price: element.saleprice));
    }
    await analytics
        .logAddPaymentInfo(
          items: analyticsEvent,
        )
        .then((value) =>
            print("Analytics shipping info adding Event added successfully"));
  }
}
