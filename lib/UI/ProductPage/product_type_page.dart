// ignore_for_file: prefer_const_constructors
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selectable_container/selectable_container.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/total%20product%20count/total_product_count_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/filter%20product/filter_single_product_details/filter_single_product_details_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/my_account/Wishlist/Wishlist%20Product%20Details/wishlist_product_details_fetching_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/product/product%20page%20details/product_page_details_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/product/product%20wishlist/product_wishlist_add_remove_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/product/product_details_api_fetch_bloc.dart';
import 'package:unicorn_store/Data/Models/Cart/View%20Cart/cart_product_data.dart';
import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20Details/filter_product_selected_attributes.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/attributes_options.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/product_attributes.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product%20Type/product_info_data.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product/single_product.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product/single_product_data.dart';
import 'package:unicorn_store/Data/Models/Product/New%20Product/type_image.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';
import 'package:unicorn_store/UI/Components/default_snackbar.dart';
import 'package:unicorn_store/UI/Components/image_path.dart';
import 'package:unicorn_store/UI/HomePage/Cart/add_to_cart.dart';
import 'package:unicorn_store/UI/HomePage/Components/third_header_text.dart';
import 'package:unicorn_store/UI/ProductPage/Components/button_with_icon.dart';
import 'package:unicorn_store/UI/size_config.dart';
import '../../Business_Logic/bloc/cart/add cart/adding_product_to_cart_bloc.dart';
import '../Components/linear_indicator.dart';
import '../HomePage/Components/price_tag.dart';
import '../LoginPage/Components/custom_submit_button.dart';
import '../../constant/constant.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatefulWidget {
  static String id = "ProductDetails_Screen";

  const ProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  String? imageSrc = " ";
  String? mainDefaultProductImage = "";
  bool expanded = false;
  // TabController? _controller;
  Map<String, String> selectedIndex = <String, String>{};

  bool productPageFlag = false;

  //creating flag for wishlist button
  bool favoriteFlag = false;

  //flag for already added to cart
  bool cartStatus = false;

  //Creating object for a bloc
  final ProductDetailsApiFetchBloc _productDetailsApiFetchBloc =
      ProductDetailsApiFetchBloc();
  final ProductPageDetailsBloc _productPageDetailsBloc =
      ProductPageDetailsBloc();
  late AuthenticationBloc authenticationBloc;
  final WishlistProductDetailsFetchingBloc wishlistProductDetailsFetchingBloc =
      WishlistProductDetailsFetchingBloc();
  final FilterSingleProductDetailsBloc filterSingleProductDetailsBloc =
      FilterSingleProductDetailsBloc();
  final ProductWishlistAddRemoveBloc productWishlistAddRemoveBloc =
      ProductWishlistAddRemoveBloc();

  late AddingProductToCartBloc addingProductToCartBloc;

  late TotalProductCountBloc totalProductCountBloc;

  ProductInfoData? productInfoData;
  SingleProductData? singleProductData;

  String? productPageId;

  String? radioButtonValue;

  bool isProgress = false;

  //Back button check flag when wishlist product added by logout user
  bool wishlistBackbuttonFlag = false;

  //Creating instance for logged in user data
  LoginData? loginData;

  //Check which screen user comes from
  bool navigationScreen = false;

  //wishlist check flag
  bool wishlist = false;
  List<dynamic> productSelectedAttributeIdValueList = [];

  //This will show product attributes
  List<ProductAttributes>? productAttributesList;

  List<FilterProductSelectedAttributes>? filterProductSelectedAttributes;

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  String? token;
  bool? isAuthenticate;

  @override
  void initState() {
    addingProductToCartBloc = AddingProductToCartBloc(
        RepositoryProvider.of<AddToLocalCartRepository>(context));
    super.initState();
    // _controller = TabController(length: 2, vsync: this);
  }

  Map<String, String> generateSelectedAttributeValue(
      List<ProductAttributes> productAttributesList,
      List<FilterProductSelectedAttributes> filterProductSelectedAttributes) {
    Map<String, String> selectedAttribute = {};
    if (filterProductSelectedAttributes.isNotEmpty) {
      for (int i = 0; i < productAttributesList.length; i++) {
        selectedAttribute.addAll({
          i.toString():
              filterProductSelectedAttributes[i].integer_value.toString()
        });
      }
    }

    return selectedAttribute;
  }

  @override
  void didChangeDependencies() {
    // print("false");
    final productDetailsId =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final productTypeSlug = productDetailsId["productTypeSlug"];
    token = productDetailsId["token"];
    navigationScreen = productDetailsId["filterProductData"];

    if (navigationScreen) {
      filterSingleProductDetailsBloc
          .add(LoadFilterSingleProductDetails(productTypeSlug, token ?? " "));
    } else {
      _productDetailsApiFetchBloc.add(LoadProductDetailsApiFetch(
          productNameSlug: productTypeSlug.toString()));
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    totalProductCountBloc = BlocProvider.of<TotalProductCountBloc>(context);
    return WillPopScope(
      onWillPop: () async {
        // if (wishlistBackbuttonFlag) {
        //   Navigator.pushAndRemoveUntil(context,
        //       MaterialPageRoute(builder: (context) {
        //     return MainScreen(
        //       selectedIndex: 0,
        //     );
        //   }), (Route<dynamic> route) => false);
        //   return false;
        // }
        // Navigator.pop(context);
        return true;
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: _buildAppBar(context),
            bottomNavigationBar: (productPageFlag)
                ? Container(
                    padding: EdgeInsets.fromLTRB(18, 10, 18, 15),
                    color: Theme.of(context).colorScheme.onPrimary,
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 30.0,
                        ),
                        InkWell(
                          onTap: (() {
                            productWishlistAddRemoveBloc.add(
                                AddRemoveProductWishlist(
                                    singleProductData!.data!.id.toString(),
                                    token ?? " "));
                          }),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                (wishlist)
                                    ? Icons.favorite_sharp
                                    : Icons.favorite_border_sharp,
                                size: 25,
                              ),
                              SizedBox(
                                height: 2.0,
                              ),
                              Text("Wishlist")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        Expanded(
                          child: (singleProductData!.data!.quantity! <= 0)
                              ? LoginButton(
                                  height: 40,
                                  title: "Notify Me When Available",
                                  color: Theme.of(context).colorScheme.primary,
                                  onPress: () {
                                    // Navigator.pushNamed(context, TextFile.id);
                                  })
                              : (cartStatus)
                                  ? ButtonWithIcon(
                                      height: 40,
                                      icon: Icon(Icons.shopping_cart_rounded),
                                      title: "Go to Cart",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      onPress: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return AddToCartPage(
                                            token: token,
                                          );
                                        }));
                                      })
                                  : ButtonWithIcon(
                                      height: 40,
                                      icon:
                                          Icon(Icons.add_shopping_cart_rounded),
                                      title: "Add to Cart",
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      onPress: () {
                                        if (loginData == null) {
                                          CartProductData cartProductData =
                                              CartProductData(
                                                  item_quantity: 1,
                                                  id: singleProductData!
                                                      .data!.id,
                                                  sku: singleProductData!
                                                      .data!.sku,
                                                  name: singleProductData!
                                                      .data!.name,
                                                  slug: singleProductData!
                                                      .data!.slug,
                                                  description:
                                                      singleProductData!
                                                          .data!.description,
                                                  excerpt: singleProductData!
                                                      .data!.excerpt,
                                                  price: singleProductData!
                                                      .data!.price!
                                                      .toDouble(),
                                                  saleprice: singleProductData!
                                                      .data!.saleprice!
                                                      .toDouble(),
                                                  quantity: singleProductData!
                                                      .data!.quantity,
                                                  related_products:
                                                      singleProductData!.data!
                                                          .related_products,
                                                  images:
                                                      singleProductData!
                                                          .data!.images,
                                                  enabled: singleProductData!.data!
                                                      .enabled,
                                                  route_id: singleProductData!
                                                      .data!.route_id,
                                                  fixed_quantity:
                                                      singleProductData!.data!
                                                          .fixed_quantity);

                                          addingProductToCartBloc.add(
                                              AddProductToLocalCartEvent(
                                                  cartProductData));
                                        } else {
                                          addingProductToCartBloc.add(
                                              AddProductToCart(
                                                  singleProductData!.data!.id!,
                                                  loginData!.userData!.token!));
                                        }

                                        // Navigator.pushNamed(context, TextFile.id);
                                      }),
                        )
                      ],
                    ))
                : SizedBox(),
            body: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => _productDetailsApiFetchBloc,
                ),
                BlocProvider(
                  create: (context) => _productPageDetailsBloc,
                ),
                BlocProvider(
                  create: (context) => filterSingleProductDetailsBloc,
                ),
                BlocProvider(
                  create: (context) => addingProductToCartBloc,
                ),
                BlocProvider(
                    create: ((context) => productWishlistAddRemoveBloc))
              ],
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationAuthenticated) {
                    loginData = state.loginData;
                    token = loginData!.userData!.token;
                    isAuthenticate = true;
                  }
                  if (state is AuthenticationUnauthenticated) {
                    isAuthenticate = false;
                  }
                  //For wishlist add remove state
                  return BlocListener<ProductWishlistAddRemoveBloc,
                      ProductWishlistAddRemoveState>(
                    listener: (context, state) {
                      if (state is ProductWishlistAddRemoveLoading) {
                        setState(() {
                          isProgress = true;
                        });
                      }
                      if (state is ProductWishlistAddRemoveLoaded) {
                        if (productPageFlag) {
                          _productPageDetailsBloc.add(
                              LoadProductDataBasedOnValueEvent(
                                  productValue:
                                      productSelectedAttributeIdValueList,
                                  productTypeId: singleProductData!
                                      .data!.parent_id
                                      .toString(),
                                  token: token ?? " "));
                        } else {
                          _productPageDetailsBloc.add(
                              LoadProductDataBasedOnValueEvent(
                                  productValue:
                                      productSelectedAttributeIdValueList,
                                  productTypeId: productInfoData!
                                      .data!.primary!.id
                                      .toString(),
                                  token: token ?? " "));
                        }
                      }
                      if (state is ProductWishlistAddRemoveFailure) {
                        setState(() {
                          isProgress = false;
                        });
                      }
                    },
                    child: BlocListener<AddingProductToCartBloc,
                        AddingProductToCartState>(
                      listener: (context, state) {
                        if (state is AddingProductToCartLoading) {
                          setState(() {
                            isProgress = true;
                          });
                        }
                        if (state is AddingProductToCartLoaded) {
                          totalProductCountBloc.add(LoadTotalCartProductCount(
                              token ?? " ", isAuthenticate!));
                          setState(() {
                            isProgress = false;
                            cartStatus = true;
                          });

                          if (isAuthenticate!) {
                            addToCartProductAnalyticsEvent(
                                singleProductData!.data!);
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            defaultSnackBar("Product Added to Cart",
                                Colors.green, Colors.white, 2000),
                          );
                        }
                        if (state is AddingProductToCartFailure) {
                          setState(() {
                            isProgress = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            defaultSnackBar(
                                state.message, Colors.red, Colors.white, 2000),
                          );
                        }
                      },
                      child: BlocListener<FilterSingleProductDetailsBloc,
                          FilterSingleProductDetailsState>(
                        listener: (context, state) {
                          if (state is FilterSingleProductDetailsLoading) {
                            setState(() {
                              isProgress = true;
                            });
                          }
                          if (state is FilterSingleProductDetailsLoaded) {
                            setState(() {
                              productPageFlag = true;
                              cartStatus = false;
                              isProgress = false;
                              singleProductData = SingleProductData(
                                  true, state.filterProductInfo!.product);
                              wishlist =
                                  singleProductData?.data?.wishlist ?? false;
                              mainDefaultProductImage =
                                  "$imageDefaultURL/product/medium/${ImagePath.getPrimaryImageSrc(singleProductData!.data!.images ?? [])}";
                              productAttributesList =
                                  state.filterProductInfo!.attributes;
                              filterProductSelectedAttributes =
                                  state.filterProductInfo!.selected_attribute;
                              selectedIndex = generateSelectedAttributeValue(
                                  productAttributesList!,
                                  filterProductSelectedAttributes!);
                              selectedIndex.entries
                                  .map((e) =>
                                      productSelectedAttributeIdValueList
                                          .add(e.value))
                                  .toList();
                              log(productSelectedAttributeIdValueList
                                  .toString());

                              // print(selectedIndex);
                            });
                          }
                          if (state is FilterSingleProductDetailsFailure) {
                            setState(() {
                              isProgress = false;
                            });
                          }
                        },
                        child: BlocListener<ProductDetailsApiFetchBloc,
                            ProductDetailsApiFetchState>(
                          listener: (context, state) {
                            if (state is ProductDetailsApiFetchLoaded) {
                              setState(() {
                                productInfoData = state.productTypeDetails;
                                mainDefaultProductImage =
                                    "/product/medium/${ImagePath.getPrimaryImageSrc(productInfoData!.data!.primary!.images ?? [])}";
                                productAttributesList =
                                    productInfoData!.data!.attribute;
                                selectedIndex = generateSelectedAttributeValue(
                                    productAttributesList!, []);
                                // print(selectedIndex);
                              });
                            }
                          },
                          child: BlocBuilder<FilterSingleProductDetailsBloc,
                              FilterSingleProductDetailsState>(
                            builder: (context, state) {
                              if (state is FilterSingleProductDetailsLoaded) {
                                productPageFlag = true;
                                return _buildProductDetailsPage(context);
                              }
                              if (state is FilterSingleProductDetailsFailure) {
                                return Center(child: Text(state.message!));
                              }
                              return BlocBuilder<ProductDetailsApiFetchBloc,
                                  ProductDetailsApiFetchState>(
                                builder: (context, state) {
                                  if (state is ProductDetailsApiFetchLoading) {
                                    return LinearIndicatorBar();
                                  } else if (state
                                      is ProductDetailsApiFetchLoaded) {
                                    return _buildProductDetailsPage(context);
                                  } else if (state
                                      is ProductDetailsApiFetchError) {
                                    return Center(
                                      child: Text(state.message!),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //  bottomNavigationBar: Bo,
          ),
          (isProgress)
              ? Container(
                  color: Colors.black54,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5.0,
                      color: Theme.of(context).colorScheme.secondary,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                )
              : Center()
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       (wishlistBackbuttonFlag)
      //           ? Navigator.pushAndRemoveUntil(context,
      //               MaterialPageRoute(builder: (context) {
      //               return MainScreen(
      //                 selectedIndex: 0,
      //               );
      //             }), (Route<dynamic> route) => false)
      //           : Navigator.of(context).pop();
      //     }),
      title: (productInfoData == null)
          ? Text(singleProductData?.data?.name ?? " ",
              style: TextStyle(
                  height: 1.5,
                  fontSize: getProportionateScreenWidth(20.0),
                  color: Theme.of(context).colorScheme.onPrimary))
          : Text(productInfoData!.data!.primary!.name ?? " ",
              style: TextStyle(
                  height: 1.5,
                  fontSize: getProportionateScreenWidth(20.0),
                  color: Theme.of(context).colorScheme.onPrimary)),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Shopping_card Icon
              BlocBuilder<TotalProductCountBloc, TotalProductCountState>(
                builder: (context, state) {
                  if (state is TotalProductCountLoaded) {
                    return InkWell(
                      onTap: () {
                        //  print("This is token: $token");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AddToCartPage(
                            token: token,
                          );
                        }));
                      },
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.transparent, shape: BoxShape.circle),
                        child: Stack(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            IconButton(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                icon: Icon(
                                  Icons.shopping_cart_sharp,
                                  size: getProportionateScreenWidth(25),
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                                tooltip: 'Shopping_cart',
                                onPressed: null),
                            Positioned(
                              right: 8,
                              top: 0,
                              child: Container(
                                width: getProportionateScreenWidth(18.0),
                                height: getProportionateScreenWidth(18.0),
                                decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text(
                                  state.totalProductCount.message.toString(),
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(12.0)),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AddToCartPage(token: token);
                      }));
                    },
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.transparent, shape: BoxShape.circle),
                      child: Stack(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              icon: Icon(
                                Icons.shopping_cart_sharp,
                                size: getProportionateScreenWidth(25),
                                color: Colors.white,
                              ),
                              tooltip: 'Shopping_cart',
                              onPressed: null),
                          Positioned(
                            right: 8,
                            top: 0,
                            child: Container(
                              width: getProportionateScreenWidth(18.0),
                              height: getProportionateScreenWidth(18.0),
                              decoration: const BoxDecoration(
                                color: Colors.lightGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(
                                "0",
                                style: TextStyle(
                                    fontSize:
                                        getProportionateScreenWidth(12.0)),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(width: getProportionateScreenWidth(5.0)),
            ],
          ),
        ),
      ],
    );
  }

  //Product Details Page
  Widget _buildProductDetailsPage(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(15.0)),
        child: Column(
          children: [
            // (productInfoData == null)
            //     ? Text(singleProductData!.data!.name ?? " ",
            //         style: TextStyle(
            //             height: 1.5,
            //             fontSize: getProportionateScreenWidth(20.0),
            //             color: Theme.of(context).colorScheme.onBackground))
            //     : Text(productInfoData!.data!.primary!.name ?? " ",
            //         style: TextStyle(
            //             height: 1.5,
            //             fontSize: getProportionateScreenWidth(20.0),
            //             color: Theme.of(context).colorScheme.onBackground)),
            // Divider(
            //   color: Theme.of(context).colorScheme.outline,
            //   thickness: 1,
            // ),
            BlocConsumer<ProductPageDetailsBloc, ProductPageDetailsState>(
              listener: (context, state) {
                if (state is ProductPageDetailsLoading) {
                  setState(() {
                    isProgress = true;
                  });
                }
                if (state is ProductPageDetailsLoaded) {
                  log("This is .....");
                  setState(() {
                    productPageFlag = true;
                    cartStatus = false;
                    singleProductData = state.productPageDetail;
                    wishlist = singleProductData?.data?.wishlist ?? false;
                    productSelectedAttributeIdValueList = state.productValue;

                    mainDefaultProductImage =
                        "$imageDefaultURL/product/medium/${ImagePath.getPrimaryImageSrc(singleProductData!.data!.images ?? [])}";
                    imageSrc = " ";
                    isProgress = false;
                  });
                  viewProductDetailsAnalyticsEvent(singleProductData!.data!);
                }
                if (state is ProductPageDetailsError) {
                  setState(() {
                    isProgress = false;
                  });
                }
              },
              builder: (context, state) {
                if (state is ProductPageDetailsLoaded) {
                  productPageFlag = true;
                  singleProductData = state.productPageDetail;
                  //imageSrc=getPrimaryImageSrc(singleProductData!.data!.images!);
                  return _buildProductData(context);
                }
                return _buildProductData(context);
              },
            )
          ],
        ),
      ),
    );
  }

  //This is widget for show product details
  Widget _buildProductData(BuildContext context) {
    // log("$categoryImageUrl/product/small/${ImagePath.getPrimaryImageSrc(singleProductData!.data!.images ?? [])}");
    log("Before: $imageDefaultURL/product/medium/$imageSrc");
    return Column(
      children: [
        (productPageFlag)
            ? Column(
                children: [
                  CachedNetworkImage(
                      width: getProportionateScreenWidth(250.0),
                      height: getProportionateScreenHeight(300.0),
                      imageUrl: (imageSrc == " ")
                          ? mainDefaultProductImage!
                          : "$imageDefaultURL/product/medium/$imageSrc",
                      placeholder: (context, url) => Container(),
                      errorWidget: (context, url, error) =>
                          const Image(image: AssetImage(errorImageUrl))),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: getProportionateScreenHeight(60.0),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15.0)),
                    child: ListView.builder(
                      itemCount: singleProductData!.data!.images!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // if (singleProductData!.data!.images![index].primary ==
                        //     true) {
                        //   imageSrc =
                        //       singleProductData!.data!.images![index].filename;
                        //   // return _buildImageList(
                        //   //     singleProductData!.data!.images!, index);
                        // }
                        return _buildImageList(
                            singleProductData!.data!.images!, index);
                      },
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  CachedNetworkImage(
                      width: getProportionateScreenWidth(250.0),
                      height: getProportionateScreenHeight(300.0),
                      imageUrl: (imageSrc == " ")
                          ? mainDefaultProductImage!
                          : "$imageDefaultURL/product/medium/$imageSrc",
                      placeholder: (context, url) => Container(),
                      errorWidget: (context, url, error) =>
                          const Image(image: AssetImage(errorImageUrl))),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: getProportionateScreenHeight(60.0),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15.0)),
                    child: ListView.builder(
                      itemCount: productInfoData!.data!.primary!.images!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // if (singleProductData!.data!.images![index].primary ==
                        //     true) {
                        //   imageSrc =
                        //       singleProductData!.data!.images![index].filename;
                        //   // return _buildImageList(
                        //   //     singleProductData!.data!.images!, index);
                        // }
                        return _buildImageList(
                            productInfoData!.data!.primary!.images!, index);
                      },
                    ),
                  ),
                ],
              ),
        // : CachedNetworkImage(
        //     width: getProportionateScreenWidth(250.0),
        //     height: getProportionateScreenHeight(250.0),
        //     imageUrl:
        //         "$imageDefaultURL/product/medium/${productInfoData!.data!.primary!.images![4].filename}",
        //     placeholder: (context, url) => Container(),
        //     errorWidget: (context, url, error) =>
        //         const Image(image: AssetImage(errorImageUrl))),
        SizedBox(
          height: 20.0,
        ),

        //Product Title
        (productPageFlag)
            ? Column(
                children: [
                  //##############  Show out of stock text ##############################
                  (singleProductData!.data!.quantity! <= 0)
                      ? Text(
                          "OUT OF STOCK",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16.0),
                            color: Colors.red,
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 10.0,
                  ),

                  //##############  Show selected product title ##############################
                  Center(
                    child: Text(
                      singleProductData!.data!.name ?? "",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: getProportionateScreenWidth(18.0)),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  //############## Sales price and price ##############
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (singleProductData!.data!.price.toString() !=
                              singleProductData!.data!.saleprice.toString())
                          ? PriceTag(
                              price: singleProductData!.data!.price.toString(),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.7),
                              textDecoration: TextDecoration.lineThrough,
                            )
                          : Container(),
                      SizedBox(
                        width: getProportionateScreenWidth(10.0),
                      ),
                      PriceTag(
                          price: singleProductData!.data!.saleprice.toString(),
                          color: Theme.of(context).colorScheme.onBackground)
                    ],
                  ),

                  SizedBox(
                    height: getProportionateScreenHeight(10.0),
                  ),

                  //Price with cashback
                  (singleProductData!.data!.affordability == 1)
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Price with Cashback: ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize:
                                          getProportionateScreenWidth(15.0)),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10.0),
                                ),
                                // PriceTag(
                                //   price: (singleProductData!.data!.saleprice! -
                                //           singleProductData!.data!.c!)
                                //       .toString(),
                                //   color: Colors.black,
                                // )
                              ],
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10.0),
                            ),
                          ],
                        )
                      : Container(),

                  // (singleProductData!.data!.discount! > 0)
                  //     ? Text(
                  //         "${productPageDetail!.discount}% off",
                  //         style: TextStyle(
                  //             fontSize: getProportionateScreenWidth(15.0),
                  //             color: Colors.green),
                  //       )
                  //     : Container(),
                ],
              )
            : Container(),
        SizedBox(
          height: getProportionateScreenHeight(30.0),
        ),

        //Select Product Color and other Details
        ListView.builder(
          itemCount: productAttributesList!.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            ProductAttributes productAttributes = productAttributesList![index];
            return Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: ThirdHeaderText(
                      thirdHeader: productAttributes.attribute_label ?? " "),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(10.0),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: productAttributes.attribute_options!.map((e) {
                      if (productAttributes.swatch_type == "color") {
                        return _buildColorContainer(
                            e, index, productAttributesList!.length);
                      } else {
                        return _buildDataContainer(
                            e, index, productAttributesList!.length);
                      }
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  //This is list of Product Images
  Widget _buildImageList(List<TypeImage> typeImage, int index) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.background,
      highlightColor: Theme.of(context).colorScheme.background,
      onTap: () {
        setState(() {
          imageSrc = typeImage[index].filename;
        });
      },
      child: Container(
        height: getProportionateScreenHeight(20.0),
        width: getProportionateScreenWidth(100.0),
        margin: EdgeInsets.only(left: getProportionateScreenWidth(10.0)),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: Theme.of(context).colorScheme.outline)),
        child: CachedNetworkImage(
            imageUrl:
                "$imageDefaultURL/product/medium/${typeImage[index].filename}",
            placeholder: (context, url) => Container(),
            errorWidget: (context, url, error) =>
                const Image(image: AssetImage(errorImageUrl))),
      ),
    );
  }

  //Select Product Data
  Widget _buildDataContainer(
      AttributesOption optionValues, int index, int length) {
    return SelectableContainer(
      //selected: true,
      selected: (selectedIndex[index.toString()]
              .toString()
              .contains(optionValues.id.toString()))
          ? true
          : false,
      marginColor: Theme.of(context).colorScheme.background,
      unselectedBackgroundColor: Theme.of(context).colorScheme.background,
      selectedBackgroundColor: Theme.of(context).colorScheme.background,
      onValueChanged: (_) {
        setState(() {
          selectedIndex[index.toString()] = optionValues.id.toString();
        });
        if (selectedIndex.keys.length == length) {
          // print(selectedIndex);
          List attributesId = [];

          selectedIndex.entries.map((e) => attributesId.add(e.value)).toList();

          if (productInfoData != null) {
            //adding bloc event
            _productPageDetailsBloc.add(LoadProductDataBasedOnValueEvent(
                productValue: attributesId,
                productTypeId: productInfoData!.data!.primary!.id.toString(),
                token: token ?? " "));
          } else {
            //adding bloc event
            _productPageDetailsBloc.add(LoadProductDataBasedOnValueEvent(
                productValue: attributesId,
                productTypeId: singleProductData!.data!.parent_id.toString(),
                token: token ?? " "));
          }
        }
      },
      padding: 10,
      iconSize: 12,
      borderRadius: 3,
      borderSize: 1,
      unselectedOpacity: 0.9,
      unselectedBorderColor: Theme.of(context).colorScheme.outline,
      child: Text(
        optionValues.option_name ?? "",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(15.0),
            color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }

  //Select Product Color
  Widget _buildColorContainer(
      AttributesOption optionValues, int index, int length) {
    return SelectableContainer(
      selected: (selectedIndex[index.toString()]
              .toString()
              .contains(optionValues.id.toString()))
          ? true
          : false,
      marginColor: Theme.of(context).colorScheme.background,
      unselectedBackgroundColor: Theme.of(context).colorScheme.background,
      selectedBackgroundColor: Theme.of(context).colorScheme.background,
      onValueChanged: (_) {
        setState(() {
          selectedIndex[index.toString()] = optionValues.id.toString();
        });

        if (selectedIndex.keys.length == length) {
          // print(selectedIndex);
          List attributesId = [];

          selectedIndex.entries.map((e) => attributesId.add(e.value)).toList();
          log(attributesId.toString());

          if (productInfoData != null) {
            //adding bloc event
            _productPageDetailsBloc.add(LoadProductDataBasedOnValueEvent(
                productValue: attributesId,
                productTypeId: productInfoData!.data!.primary!.id.toString(),
                token: token ?? " "));
          } else {
            //adding bloc event
            _productPageDetailsBloc.add(LoadProductDataBasedOnValueEvent(
                productValue: attributesId,
                productTypeId: singleProductData!.data!.parent_id.toString(),
                token: token ?? " "));
          }
        }
      },
      padding: 7,
      iconSize: 12,
      borderRadius: 3,
      borderSize: 1,
      unselectedOpacity: 0.9,
      unselectedBorderColor: Theme.of(context).colorScheme.outline,
      child: SizedBox(
        width: getProportionateScreenWidth(80.0),
        child: Column(
          children: [
            Container(
              height: getProportionateScreenHeight(30.0),
              width: getProportionateScreenWidth(30.0),
              decoration: BoxDecoration(
                color: Color(int.parse(
                    "0xFF${optionValues.swatch_value?.substring(1)}")),
                shape: BoxShape.circle,
                border:
                    Border.all(color: Theme.of(context).colorScheme.outline),
              ),
            ),
            SizedBox(width: 15.0),
            FittedBox(
              child: Text(
                optionValues.option_name ?? " ",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15.0),
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.8)),
              ),
            )
          ],
        ),
      ),
    );
  }

  //#####################   Creating google analytics event ##############################

  Future<void> addToCartProductAnalyticsEvent(
      SingleProduct singleProduct) async {
    final productDetails = AnalyticsEventItem(
      itemId: singleProduct.id.toString(),
      itemName: singleProduct.name,
      price: singleProduct.price,
      quantity: 1,
    );

    await analytics.logAddToCart(
      items: [productDetails],
    ).then((value) => print("Analytics add to cart event added successfully!"));
  }

  Future<void> viewProductDetailsAnalyticsEvent(
      SingleProduct singleProduct) async {
    final productDetails = AnalyticsEventItem(
      itemId: singleProduct.id.toString(),
      itemName: singleProduct.name,
      price: singleProduct.price,
      quantity: 1,
    );

    await analytics.logViewItem(
      items: [productDetails],
    ).then((value) =>
        print("Analytics view product details event added successfully!"));
  }
}
