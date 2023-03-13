import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/UI/HomePage/Store%20Locator/store_locator_screen.dart';
import '../../../Business_Logic/bloc/cart/total product count/total_product_count_bloc.dart';
import '../../size_config.dart';
import '../Cart/add_to_cart.dart';

class SearchStoreScreen extends StatefulWidget {
  const SearchStoreScreen({Key? key}) : super(key: key);

  @override
  State<SearchStoreScreen> createState() => _SearchStoreScreenState();
}

class _SearchStoreScreenState extends State<SearchStoreScreen> {
  String? token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            token = state.loginData.userData!.token;
          }

          return SafeArea(
              child: Column(
            children: [
              IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Listing",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      VerticalDivider(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "Map",
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 241, 241, 241),
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Andheri Unicorn Store",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.6),
                                    size: 16.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "001-002 Kotia Nirman, New Link Road, Near Fun Republic, Andheri West, Mumbai - 400053",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.6)),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.6),
                                    size: 16.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Mon to Sat 10:00-20:30, Sun 12.00-18:00",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.6)),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_in_talk_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.6),
                                    size: 16.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "9869902323",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground
                                              .withOpacity(0.6)),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.0),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary
                                            .withOpacity(0.09),
                                        border: Border.all(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                    child: Text(
                                      "Unicorn Flagship store",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 12),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const StoreLocatorScreen();
                                      }));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "More",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded,
                                            size: 15.0,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Divider(
                                color: Colors.grey[600]!.withOpacity(0.3),
                              )
                            ],
                          ),
                        );
                      })),
                ),
              )
            ],
          ));
        },
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
      actions: [
        const Spacer(
          flex: 2,
        ),
        Expanded(
            flex: 9,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  cursorColor: Theme.of(context).colorScheme.onPrimary,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0.0, left: 12),
                      hintText: "Search Store",
                      hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.onPrimary),
                      isDense: true,
                      suffixIcon: Icon(
                        Icons.search,
                        size: 20.0,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                ),
              ),
            )),
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
}
