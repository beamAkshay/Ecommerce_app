import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/Wishlist/Wishlist%20Product%20Details/wishlist_product_details_fetching_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Wishlist/images_list.dart';
import 'package:unicorn_store/Data/Models/MyAccount/Wishlist/wishlist_details.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/constant/constant.dart';

import '../../Business_Logic/bloc/cart/add cart/adding_product_to_cart_bloc.dart';
import '../../Business_Logic/bloc/cart/total product count/total_product_count_bloc.dart';
import '../../Data/Repositories/cart/add_to_local_cart_repository.dart';
import '../Components/default_snackbar.dart';
import '../size_config.dart';

class WishlistPage extends StatefulWidget {
  static String id = "Wishlist_Screen";

  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  //creating instace for wishlistbloc
  WishlistProductDetailsFetchingBloc wishlistProductDetailsFetchingBloc =
      WishlistProductDetailsFetchingBloc();

  //Creating instace for wishlist product details
  WishlistDetails? wishlistDetails;

  late AddingProductToCartBloc addingProductToCartBloc;
  late TotalProductCountBloc totalProductCountBloc;
  // ignore: prefer_typing_uninitialized_variables
  var userLoginData;

  //getting logged in user details
  LoginData? loginData;

  String? token;
  bool? isAuthenticate;
  bool isProgress = false;

  @override
  void didChangeDependencies() {
    addingProductToCartBloc = AddingProductToCartBloc(
        RepositoryProvider.of<AddToLocalCartRepository>(context));
    totalProductCountBloc = BlocProvider.of<TotalProductCountBloc>(context);

    userLoginData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    loginData = userLoginData["loginData"];
    if (loginData != null) {
      token = loginData!.userData!.token;
      isAuthenticate = true;
    } else {
      isAuthenticate = false;
    }

    wishlistProductDetailsFetchingBloc.add(
        LoadWishlistProductDetailsApiFetch(token: loginData!.userData!.token!));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BuildAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => wishlistProductDetailsFetchingBloc,
          ),
          BlocProvider(
            create: (context) => addingProductToCartBloc,
          ),
        ],
        child: BlocListener<AddingProductToCartBloc, AddingProductToCartState>(
          listener: (context, state) {
            if (state is AddingProductToCartLoading) {
              setState(() {
                isProgress = true;
              });
            }
            if (state is AddingProductToCartLoaded) {
              wishlistProductDetailsFetchingBloc.add(
                  LoadWishlistProductDetailsApiFetch(
                      token: loginData!.userData!.token!));
              totalProductCountBloc.add(
                  LoadTotalCartProductCount(token ?? " ", isAuthenticate!));
              // setState(() {
              //   isProgress = false;
              //   // cartStatus = true;
              // });

              // if (isAuthenticate!) {
              //   addToCartProductAnalyticsEvent(singleProductData!.data!);
              // }

              ScaffoldMessenger.of(context).showSnackBar(
                defaultSnackBar(
                    "Product Added to Cart", Colors.green, Colors.white, 2000),
              );
            }
            if (state is AddingProductToCartFailure) {
              setState(() {
                isProgress = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                defaultSnackBar(state.message, Colors.red, Colors.white, 2000),
              );
            }
          },
          child: BlocListener<WishlistProductDetailsFetchingBloc,
              WishlistProductDetailsFetchingState>(
            listener: (context, state) {
              if (state is WishlistProductDetailsFetchingLoading) {
                setState(() {
                  isProgress = true;
                });
              }
              if (state is WishlistProductDetailsFetchingLoaded) {
                setState(() {
                  wishlistDetails = state.wishlistDetails;
                  isProgress = false;
                });
              }
              if (state is AddOrRemoveProductFromWishlistSuccess) {
                setState(() {
                  isProgress = false;
                  wishlistDetails = state.wishlistDetails;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Product removed from wishlist."),
                    backgroundColor: Theme.of(context).colorScheme.tertiary,
                    duration: const Duration(milliseconds: 2000),
                    // behavior: SnackBarBehavior.floating,
                  ),
                );
              }
              if (state is WishlistProductDetailsFetchingError) {
                setState(() {
                  isProgress = false;
                });
              }
            },
            child: Stack(
              children: [
                BlocBuilder<WishlistProductDetailsFetchingBloc,
                    WishlistProductDetailsFetchingState>(
                  builder: (context, state) {
                    // if (state is WishlistProductDetailsFetchingLoading) {
                    //   return const LinearIndicatorBar();
                    // } else
                    if (state is AddOrRemoveProductFromWishlistSuccess) {
                      return (isProgress)
                          ? Container(
                              color: Colors.white,
                            )
                          : _buildWishlistProduct();
                    } else if (state is WishlistProductDetailsFetchingLoaded) {
                      return (isProgress)
                          ? Container(
                              color: Colors.white,
                            )
                          : _buildWishlistProduct();
                    } else if (state is WishlistProductDetailsFetchingError) {
                      return (isProgress)
                          ? Container(
                              color: Colors.white,
                            )
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Text(
                                  state.message.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                    }
                    //  print(state);
                    return Container();
                  },
                ),
                (isProgress) ? const LinearIndicatorBar() : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //getting primary product from image list
  String? getPrimaryImageSrc(List<ImageList>? images) {
    String? path;
    for (var element in images ?? []) {
      if (element.primary == true && element.primary != null) {
        path = element.filename;
      }
    }
    return path;
  }

  Widget _buildWishlistProduct() {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Wishlist",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(25.0),
                  color: Theme.of(context).colorScheme.onBackground)),
          const Divider(
            color: kDefaultBorderColor,
            thickness: 1,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: wishlistDetails?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return //***************Add on Accessories************
                      Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            bottom: getProportionateScreenWidth(15.0)),
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15.0)),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.outline),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2.0)),
                        ),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(15.0),
                            ),
                            CachedNetworkImage(
                              height: getProportionateScreenHeight(150),
                              width: getProportionateScreenWidth(150),
                              imageUrl:
                                  "$imageDefaultURL$imageSecondUrl${getPrimaryImageSrc(wishlistDetails?.data?[index].productDetails?.images)}",
                              placeholder: (context, url) => Container(),
                              errorWidget: (context, url, error) => const Image(
                                fit: BoxFit.fill,
                                image: AssetImage(errorImageUrl),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(25.0),
                            ),
                            Divider(
                              color: Theme.of(context).colorScheme.outline,
                              thickness: 1,
                            ),
                            Text(
                              wishlistDetails?.data?[index].productDetails?.name
                                      .toString() ??
                                  " ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: getProportionateScreenWidth(15.0)),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(15.0),
                            ),
                            (wishlistDetails
                                        ?.data?[index].productDetails?.quantity
                                        .toString() !=
                                    "0")
                                ? LoginButton(
                                    title: "Add to Cart",
                                    onPress: () {
                                      addingProductToCartBloc.add(
                                          AddProductToCart(
                                              wishlistDetails!.data![index]
                                                  .productDetails!.id!,
                                              token ?? " "));
                                    },
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  )
                                : Text(
                                    "Out of stock",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            getProportionateScreenWidth(15.0)),
                                  ),
                            SizedBox(
                              height: getProportionateScreenHeight(20.0),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            wishlistProductDetailsFetchingBloc.add(
                                AddOrDeleteProductFromWishlistEvent(
                                    productId: wishlistDetails!
                                        .data![index].productId
                                        .toString(),
                                    token: loginData!.userData!.token!));
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            size: getProportionateScreenWidth(25.0),
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.3),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
