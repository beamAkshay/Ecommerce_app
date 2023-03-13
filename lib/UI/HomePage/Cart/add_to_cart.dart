import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/product%20service%20check/product_service_check_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/total%20price%20calculate/total_price_calculate_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/total%20product%20count/total_product_count_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/update%20order%20value/update_order_value_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/view%20cart/view_cart_product_list_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/checkout/guest%20checkout%20status/guest_checkout_status_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/checkout/guest%20checkout%20status/save%20guest%20user%20details/save_guest_user_details_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/save%20guest%20user%20address/guest_user_address.dart';
import 'package:unicorn_store/Data/Models/Checkout/Guest%20Chekout%20Status/save%20guest%20user%20address/guest_user_product_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/Country%20Dropdown/country_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Address%20Manager/State/data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';
import 'package:unicorn_store/UI/Components/default_snackbar.dart';
import 'package:unicorn_store/UI/Components/loading_indicator_bar_with_no_background.dart';
import 'package:unicorn_store/UI/HomePage/Cart/Components/cart_product.dart';
import 'package:unicorn_store/UI/LoginPage/login_form.dart';
import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/checkout_page.dart';
import 'package:unicorn_store/UI/size_config.dart';
import 'package:unicorn_store/constant/constant.dart';
import '../../../Business_Logic/bloc/cart/remove and wishlist/remove_cart_item_bloc.dart';
import '../../../Business_Logic/bloc/my_account/address manager/load country and state/country_bloc/country_data_api_fetch_bloc.dart';
import '../../../Business_Logic/bloc/my_account/address manager/load country and state/state_bloc/state_data_api_fetch_bloc.dart';
import '../../../Data/Models/Cart/View Cart/cart_product_data.dart';
import '../../../Data/Models/MyAccount/Address Manager/Country Dropdown/data.dart';
import '../../My Account/Checkout Page/Components/form_validation_mixin.dart';
import '../../My Account/Checkout Page/Components/text_input_field_for_checkout.dart';
import '../Components/price_tag.dart';
import 'Components/show_when_cart_is_empty.dart';
import 'Components/text_form_field_with_button.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'dart:math' as math; // import this

class AddToCartPage extends StatefulWidget {
  final String? token;
  const AddToCartPage({Key? key, this.token}) : super(key: key);

  @override
  State<AddToCartPage> createState() => _AddToCartPageState();
}

class _AddToCartPageState extends State<AddToCartPage>
    with FormValidationMixin {
  //Creating instance for bloc
  late ViewCartProductListBloc viewCartProductListBloc;
  late TotalProductCountBloc totalProductCountBloc;
  final TotalPriceCalculateBloc totalPriceCalculateBloc =
      TotalPriceCalculateBloc();
  final ProductServiceCheckBloc productServiceCheckBloc =
      ProductServiceCheckBloc();
  final GuestCheckoutStatusBloc guestCheckoutStatusBloc =
      GuestCheckoutStatusBloc();
  final StateDataApiFetchBloc stateDataApiFetchBloc = StateDataApiFetchBloc();
  final CountryDataApiFetchBloc countryDataApiFetchBloc =
      CountryDataApiFetchBloc();
  final SaveGuestUserDetailsBloc saveGuestUserDetailsBloc =
      SaveGuestUserDetailsBloc();
  final UpdateOrderValueBloc updateOrderValueBloc = UpdateOrderValueBloc();

  final _formKey = GlobalKey<FormState>();
  final _shippingAddressFormKey = GlobalKey<FormState>();

  bool isProgress = false;
  bool isSaveGuestUserAddressProgress = false;
  late RemoveCartItemBloc removeCartItemBloc;
  List<CartProductData>? cartProductData;
  Map<String, dynamic> totalPriceList = {};

  //creating controller for pincode and coupon check
  final _picodeCodeCheck = TextEditingController();
  final _couponCheck = TextEditingController();
  bool errorBorder = false;
  bool enableChekoutButton = false;
  bool? isAuthenticate;

  //setting values for country drop down button
  CountryList? countryList;
  Country? country;

  //setting values for state dropdown button
  List<StateData>? stateList = [];
  StateData? stateData;

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

  bool customErrorDialog = false;
  String customErrorMessage = "";
  Timer? timer;
  String? token;
  String a = "0xffce107c";

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    token = widget.token;

    viewCartProductListBloc = ViewCartProductListBloc(
        RepositoryProvider.of<AddToLocalCartRepository>(context));
    removeCartItemBloc = RemoveCartItemBloc(
        RepositoryProvider.of<AddToLocalCartRepository>(context));

    countryDataApiFetchBloc.add(LoadCountryDataFetchApi(token ?? " "));
    if (token == null) {
      isAuthenticate = false;
    } else {
      isAuthenticate = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    totalProductCountBloc = BlocProvider.of<TotalProductCountBloc>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => viewCartProductListBloc
            ..add(LoadCartProductList(token ?? " ", isAuthenticate!)),
        ),
        BlocProvider(
          create: (context) => removeCartItemBloc,
        ),
        BlocProvider(
          create: (context) => totalPriceCalculateBloc,
        ),
        BlocProvider(
          create: (context) => productServiceCheckBloc,
        ),
        BlocProvider(
          create: (context) => guestCheckoutStatusBloc,
        ),
        BlocProvider.value(
          value: stateDataApiFetchBloc,
        ),
        BlocProvider(create: (context) => countryDataApiFetchBloc),
        BlocProvider(create: (context) => saveGuestUserDetailsBloc),
      ],
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              token = state.loginData.userData!.token ?? " ";
              isAuthenticate = true;
            }
            if (state is AuthenticationUnauthenticated) {
              isAuthenticate = false;
            }
            return Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.all(getProportionateScreenWidth(15.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Your Cart",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(25),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.8)),
                              ),
//                              const Spacer(),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.outline,
                            thickness: 1,
                          ),
                          BlocConsumer<ViewCartProductListBloc,
                              ViewCartProductListState>(
                            listener: (context, state) {
                              if (state is ViewCartProductListLoading) {
                                setState(() {
                                  isProgress = true;
                                });
                              }
                              if (state is ViewCartProductListLoaded) {
                                setState(() {
                                  isProgress = false;
                                  cartProductData = state.cartProductData;
                                });
                                viewCartProductAnalyticsEvent();
                              }
                              if (state is ViewLocalCartProductListLoaded) {
                                setState(() {
                                  isProgress = false;
                                  cartProductData = state.cartProductData;
                                });
                              }
                              if (state is ViewCartProductListEmpty) {
                                setState(() {
                                  isProgress = false;
                                });
                              }
                              if (state is ViewCartProductListFailure) {
                                print(state);
                                setState(() {
                                  isProgress = false;
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state is ViewCartProductListLoaded) {
                                return _buildCartProductList();
                              }
                              if (state is ViewLocalCartProductListLoaded) {
                                return _buildCartProductList();
                              }
                              if (state is ViewCartProductListEmpty) {
                                return const ShowWhenCartIsEmpty();
                              }
                              if (state is ViewCartProductListFailure) {
                                // print(token);
                                return Center(
                                  child: Text(state.message),
                                );
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                (isProgress)
                    ? const LoadingIndicatorBarWithNoBackground()
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildCartProductList() {
    return (cartProductData!.isNotEmpty)
        ? BlocConsumer<RemoveCartItemBloc, RemoveCartItemState>(
            listener: (context, state) {
              if (state is RemoveCartItemLoading) {
                setState(() {
                  isProgress = true;
                });
              }
              if (state is RemoveCartItemSuccess) {
                // viewCartProductListBloc
                //     .add(LoadCartProductList(token ?? " ", isAuthenticate!));
                cartProductData!.removeAt(state.productIndex);

                totalProductCountBloc.add(
                    LoadTotalCartProductCount(token ?? " ", isAuthenticate!));
                setState(() {
                  isProgress = false;
                });
                if (state.isAuthenticate) {
                  removeCartProductAnalyticsEvent(state.cartProductData);
                }
                ScaffoldMessenger.of(context).showSnackBar(defaultSnackBar(
                    "Product has been removed to successfully",
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.onTertiary,
                    2000));
              }
              if (state is MoveToWishlistProductSuccess) {
                viewCartProductListBloc
                    .add(LoadCartProductList(token ?? " ", isAuthenticate!));
                totalProductCountBloc.add(
                    LoadTotalCartProductCount(token ?? " ", isAuthenticate!));
                setState(() {
                  isProgress = false;
                });

                //This call analytics event
                addToWishlistCartProductAnalyticsEvent(state.cartProductData);
                ScaffoldMessenger.of(context).showSnackBar(defaultSnackBar(
                    "Product has been moved to wishlist",
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.onTertiary,
                    2000));
              }
              if (state is RemoveCartItemFailure) {
                setState(() {
                  isProgress = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(defaultSnackBar(
                    state.message,
                    Theme.of(context).errorColor,
                    Theme.of(context).colorScheme.onError,
                    2000));
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    //List of Card Product
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartProductData!.length,
                        itemBuilder: (context, index) {
                          totalPriceList.addAll(
                              {cartProductData![index].id.toString(): 0.0});
                          return CartProduct(
                            cartProduct: cartProductData![index],
                            token: token ?? " ",
                            onPressed: (cartItemId) {
                              removeCartItemBloc.add(RemoveItemCart(
                                  cartItemId.cart_item_id ?? -1,
                                  token ?? " ",
                                  isAuthenticate!,
                                  cartProductData![index].id!,
                                  index,
                                  cartItemId));
                            },
                            addToWishlist: (cartItemId) {
                              removeCartItemBloc.add(MoveToWishlistCartItem(
                                  cartItemId.cart_item_id!,
                                  token ?? " ",
                                  cartItemId));
                            },
                            totalPriceList: totalPriceList,
                            isAuthenticate: isAuthenticate!,
                            index: index,
                          );
                        }),

                    //     ************Order Summary*******//
                    BlocConsumer<GuestCheckoutStatusBloc,
                        GuestCheckoutStatusState>(
                      listener: (context, state) {
                        if (state is GuestCheckoutStatusLoading) {
                          setState(() {
                            isProgress = true;
                          });
                        }
                        if (state is GuestCheckoutStatusSuccess) {
                          if (state.guestCheckoutStatus.data == 1) {
                            setState(() {
                              isProgress = false;
                            });
                            _buildGuestUserAddress();
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen(
                                myAccountRedirect: "guest_checkout",
                                guestUserProductData: guestUserProductData(),
                                cartProductData: cartProductData,
                              );
                            })).then((value) {
                              setState(() {
                                viewCartProductListBloc.add(LoadCartProductList(
                                    token ?? " ", isAuthenticate!));
                              });
                            });
                            setState(() {
                              isProgress = false;
                            });
                          }
                        }
                        if (state is GuestCheckoutStatusFailure) {
                          setState(() {
                            isProgress = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              defaultSnackBar(
                                  state.message,
                                  Theme.of(context).errorColor,
                                  Theme.of(context).colorScheme.onError,
                                  2000));
                        }
                      },
                      builder: (context, state) {
                        return Card(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(10.0)),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline),
                                  ),
                                ),
                                child: Text(
                                  "Order Summary",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(15.0)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(15.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15.0)),
                                        ),
                                        const Spacer(),
                                        BlocBuilder<TotalPriceCalculateBloc,
                                            TotalPriceCalculateState>(
                                          builder: (context, state) {
                                            if (state
                                                is TotalPriceCalculateSuccess) {
                                              return PriceTag(
                                                  price: state.totalPrice
                                                      .floor()
                                                      .toString());
                                            }
                                            return const PriceTag(price: "00");
                                          },
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          getProportionateScreenHeight(10.0),
                                    ),
                                    Text(
                                      "* Inclusive of all taxes",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(12.0),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                    ),
                                    const Divider(
                                      color: kDefaultBorderColor,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height:
                                          getProportionateScreenHeight(10.0),
                                    ),
                                    //Pin Check out Input
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormFieldAndButton(
                                          errorBorder: errorBorder,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter pincode';
                                            }
                                            return null;
                                          },
                                          controller: _picodeCodeCheck,
                                          buttonTitle: "Check",
                                          hintText: "Enter Pincode",
                                          onPress: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              FocusScope.of(context).unfocus();
                                              productServiceCheckBloc.add(
                                                  CheckProductService(
                                                      _picodeCodeCheck.text));
                                            }
                                          },
                                        ),
                                        BlocListener<ProductServiceCheckBloc,
                                            ProductServiceCheckState>(
                                          listener: (context, state) {
                                            if (state
                                                is ProductServiceCheckLoaded) {
                                              setState(() {
                                                enableChekoutButton = true;
                                                errorBorder = false;
                                              });
                                            }
                                            if (state
                                                is ProductServiceCheckFailure) {
                                              setState(() {
                                                enableChekoutButton = false;

                                                errorBorder = true;
                                              });
                                            }
                                          },
                                          child: BlocBuilder<
                                              ProductServiceCheckBloc,
                                              ProductServiceCheckState>(
                                            builder: (context, state) {
                                              if (state
                                                  is ProductServiceCheckLoading) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 30.0),
                                                  child: Center(
                                                    child: Transform.scale(
                                                      scale: 0.9,
                                                      child:
                                                          CircularProgressIndicator(
                                                        strokeWidth: 4.0,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              if (state
                                                  is ProductServiceCheckLoaded) {
                                                errorBorder = false;

                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        "Service is available on ${_picodeCodeCheck.text}",
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .tertiary,
                                                            fontSize: 14.0),
                                                      ),
                                                      const SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Row(children: [
                                                        Transform(
                                                            alignment: Alignment
                                                                .center,
                                                            transform: Matrix4
                                                                .rotationY(
                                                                    math.pi),
                                                            child: Icon(
                                                              Icons
                                                                  .local_shipping_rounded,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .tertiary,
                                                              size: 20.0,
                                                            )),
                                                        const SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Text(
                                                          "Ships in 4-5 Working Days.",
                                                          style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .tertiary,
                                                              fontSize: 14.0),
                                                        ),
                                                      ]),
                                                    ],
                                                  ),
                                                );
                                              }
                                              if (state
                                                  is ProductServiceCheckFailure) {
                                                errorBorder = true;

                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0, top: 5.0),
                                                  child: Text(
                                                    state.message,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .error,
                                                        fontSize: 14.0),
                                                  ),
                                                );
                                              }
                                              return Container();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          getProportionateScreenHeight(10.0),
                                    ),

                                    //Continue Checkout Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: (!enableChekoutButton)
                                            ? null
                                            : () {
                                                if (isAuthenticate!) {
                                                  updateOrderValueBloc.add(
                                                      UpdateOrderValue(token!));
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                            return CheckoutPage(
                                                              currentStep: 0,
                                                              token:
                                                                  token ?? " ",
                                                              cartProductData:
                                                                  cartProductData,
                                                            );
                                                          },
                                                          settings:
                                                              const RouteSettings(
                                                                  name:
                                                                      "/CheckoutPage_Screen")));
                                                } else {
                                                  guestCheckoutStatusBloc.add(
                                                      CheckGuestCheckoutStatus());
                                                }
                                              },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primary, // background
                                          foregroundColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                        child: Text(
                                          "Continue Checkout",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      15.0)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //****************Coupon Discount**************//
                    // ignore: avoid_unnecessary_containers
                    Container(
                      // width: double.infinity,
                      // margin: EdgeInsets.all(
                      //     getProportionateScreenWidth(10.0)),
                      // decoration: BoxDecoration(
                      //   border: Border.all(
                      //       color: kDefaultBorderColor),
                      // ),
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(10.0)),
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: kDefaultBorderColor),
                                ),
                              ),
                              child: Text(
                                "Coupon Discount",
                                style: TextStyle(
                                    fontSize:
                                        getProportionateScreenWidth(15.0)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(15.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Coupon code Input Field
                                  TextFormFieldAndButton(
                                    controller: _couponCheck,
                                    errorBorder: false,
                                    onPress: () {},
                                    validator: (value) {
                                      return null;
                                    },
                                    buttonTitle: "Apply",
                                    hintText: "Enter Coupon Code",
                                  ),

                                  SizedBox(
                                    height: getProportionateScreenHeight(5.0),
                                  ),
                                  Divider(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                    thickness: 1,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15.0),
                                  ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.info_sharp,
                                        size:
                                            getProportionateScreenHeight(20.0),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5.0),
                                      ),
                                      Text(
                                        "Need any help?",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    15.0)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5.0),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Speak to Our e-commerce specialist :",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    12.0)),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(5),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone_sharp,
                                            size: getProportionateScreenHeight(
                                                13.0),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                          Text(
                                            "1800267788",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : const ShowWhenCartIsEmpty();
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      actions: const [
        Spacer(flex: 2),
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(2.0),
              child: Image(
                image: AssetImage("assets/unicornLogo.png"),
                fit: BoxFit.fitHeight,
              ),
            )),
        Spacer(
          flex: 5,
        ),
        // Expanded(
        //   flex: 5,
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(
        //         horizontal: getProportionateScreenWidth(10.0)),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         SizedBox(width: getProportionateScreenWidth(5.0)),
        //         //SearchButton
        //         IconButton(
        //           highlightColor: Colors.transparent,
        //           splashColor: Colors.transparent,
        //           icon: Icon(
        //             Icons.search,
        //             size: getProportionateScreenWidth(25),
        //             color: Colors.white,
        //           ),
        //           tooltip: 'Search',
        //           onPressed: () {
        //             showSearch(
        //                 context: context, delegate: CustomSearchDelegate());
        //           },
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  //Dialog for select address folr guest user
  Future<void> _buildGuestUserAddress() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: stateDataApiFetchBloc,
            ),
            BlocProvider.value(
                value: countryDataApiFetchBloc
                  ..add(LoadCountryDataFetchApi(token ?? " "))),
            BlocProvider.value(value: saveGuestUserDetailsBloc),
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
                          const Text(
                            'Shipping Address',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
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
                            },
                            padding: const EdgeInsets.all(0.0),
                            iconSize: 35.0,
                            icon: const Icon(
                              Icons.cancel_rounded,
                            ),
                            color: Colors.grey.shade400,
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
                                    if (_shippingAddressFormKey.currentState!
                                        .validate()) {
                                      GuestUserAddress guestUserAddress =
                                          GuestUserAddress(
                                              firstname:
                                                  _shippingAddressFirstName
                                                      .text,
                                              lastname:
                                                  _shippingAddressLastName.text,
                                              email: _shippingAddressEmail.text,
                                              phone: _shippingAddressPhone.text,
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
                                              zone_id: stateData!.id,
                                              product_ids:
                                                  guestUserProductData());
                                      saveGuestUserDetailsBloc.add(
                                          SaveGuestUserDetails(
                                              guestUserAddress));
                                    }
                                  },
                                  child: const Text("Continue")),
                            ),
                          ),
                          (customErrorDialog)
                              ? Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    customErrorMessage,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                  ))
                              : Container(),
                        ],
                      )
                    ],
                    content: BlocConsumer<SaveGuestUserDetailsBloc,
                        SaveGuestUserDetailsState>(
                      listener: (context, state) {
                        if (state is SaveGuestUserDetailsLoading) {
                          settingState(() {
                            isSaveGuestUserAddressProgress = true;
                          });
                        }
                        if (state is SaveGuestUserDetailsLoaded) {
                          settingState(() {
                            isSaveGuestUserAddressProgress = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) {
                                    return CheckoutPage(
                                      currentStep: 1,
                                      token: token ?? " ",
                                      cartProductData: cartProductData,
                                    );
                                  },
                                  settings: const RouteSettings(
                                      name: "/CheckoutPage_Screen")));
                        }
                        if (state is SaveGuestUserDetailsFailure) {
                          settingState(() {
                            isSaveGuestUserAddressProgress = false;
                            customErrorDialog = true;
                            customErrorMessage = state.message;
                          });
                          timer = Timer(const Duration(seconds: 3), () {
                            settingState(() {
                              isSaveGuestUserAddressProgress = false;
                              customErrorDialog = false;
                              customErrorMessage = "";
                            });
                          });
                        }
                      },
                      builder: (context, state) {
                        return Form(
                          key: _shippingAddressFormKey,
                          child: Container(
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
                                  validator: isEmpty,
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
                                  validator: isEmpty,
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
                                  validator: isEmpty,
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
                                  validator: isEmpty,
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
                                  validator: isEmpty,
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
                                  validator: isEmpty,
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
                                  validator: isEmpty,
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
                                    print(countryDataApiFetchBloc.state);
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
                                                getProportionateScreenHeight(
                                                    5.0),
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
                                                    color:
                                                        kDefaultBorderColor)),
                                            child: DropdownButtonHideUnderline(
                                              child: ButtonTheme(
                                                alignedDropdown: true,
                                                child: DropdownButton<Country>(
                                                  // Initial Value
                                                  value: country,

                                                  isDense: true,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    color:
                                                        const Color(0xFF000000)
                                                            .withOpacity(0.54),
                                                  ),
                                                  style: TextStyle(
                                                      color: const Color(
                                                              0xFF000000)
                                                          .withOpacity(0.8),
                                                      fontSize: 16.0),

                                                  isExpanded: true,
                                                  hint: Text("Select country",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xFF454545),
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
                                                  onChanged:
                                                      (Country? newValue) {
                                                    settingState(() {
                                                      country = newValue;
                                                    });

                                                    stateDataApiFetchBloc.add(
                                                        LoadStateData(
                                                            countryID: newValue!
                                                                .id
                                                                .toString(),
                                                            token: token ?? " ",
                                                            eventChecker:
                                                                false));
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
                                                  color: kDefaultBorderColor)),
                                          child: DropdownButtonHideUnderline(
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child: DropdownButton<StateData>(
                                                // Initial Value
                                                value: stateData,
                                                isDense: true,
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: const Color(0xFF000000)
                                                      .withOpacity(0.54),
                                                ),
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF000000)
                                                            .withOpacity(0.8),
                                                    fontSize: 16.0),

                                                isExpanded: true,
                                                hint: Text("Select state",
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF454545),
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
                                                onChanged:
                                                    (StateData? newValue) {
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
                          ),
                        );
                      },
                    )),
                (isSaveGuestUserAddressProgress)
                    ? Container(
                        color: Colors.black12,
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5.0,
                            color: kDefaultSecondaryButtonColor,
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

  List<GuestUserProductData> guestUserProductData() {
    List<GuestUserProductData> guestUserData = [];

    for (var element in cartProductData!) {
      guestUserData.add(GuestUserProductData(
          product_id: element.id, quantity: element.item_quantity));
    }
    return guestUserData;
  }

  Future<void> viewCartProductAnalyticsEvent() async {
    List<AnalyticsEventItem> analyticsEvent = [];
    for (var element in cartProductData!) {
      analyticsEvent.add(AnalyticsEventItem(
          itemName: element.name,
          itemId: element.cart_item_id.toString(),
          quantity: element.quantity,
          price: element.saleprice));
    }
    print(analyticsEvent.length);
    await analytics
        .logViewCart(items: analyticsEvent)
        .then((value) => print("Analytics view cart Event added successfully"));
  }

  Future<void> removeCartProductAnalyticsEvent(
      CartProductData cartProductData) async {
    final jeggingsWithQuantity = AnalyticsEventItem(
      itemId: cartProductData.cart_item_id.toString(),
      itemName: cartProductData.name,
      price: cartProductData.price,
      quantity: 1,
    );
    await analytics.logRemoveFromCart(
      items: [jeggingsWithQuantity],
    ).then((value) => print("Analytics remove cart Event added successfully"));
  }

  Future<void> addToWishlistCartProductAnalyticsEvent(
      CartProductData cartProductData) async {
    final cartProduct = AnalyticsEventItem(
      itemId: cartProductData.cart_item_id.toString(),
      itemName: cartProductData.name,
      price: cartProductData.price,
      quantity: 1,
    );
    await analytics.logAddToWishlist(
      items: [cartProduct],
    ).then(
        (value) => print("Analytics add to wishlist Event added successfully"));
  }
}
