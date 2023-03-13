import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/total%20product%20count/total_product_count_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/UI/HomePage/Cart/add_to_cart.dart';
import 'package:unicorn_store/UI/HomePage/Search%20Button/custom_search_delegate.dart';
import 'package:unicorn_store/UI/size_config.dart';

class BuildAppBar extends StatefulWidget with PreferredSizeWidget {
  const BuildAppBar({
    Key? key,
  }) : super(key: key);

  // ignore: annotate_overrides
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<BuildAppBar> createState() => _BuildAppBarState();
}

class _BuildAppBarState extends State<BuildAppBar> {
  String? token;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            token = state.loginData.userData!.token;
          }
          return AppBar(
            actions: [
              const Spacer(flex: 2),
              const Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Image(
                      image: AssetImage("assets/unicornLogo.png"),
                      fit: BoxFit.fitHeight,
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Shopping_card Icon
                      BlocBuilder<TotalProductCountBloc,
                          TotalProductCountState>(
                        builder: (context, state) {
                          if (state is TotalProductCountLoaded) {
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
                                    color: Colors.transparent,
                                    shape: BoxShape.circle),
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
                                        width:
                                            getProportionateScreenWidth(18.0),
                                        height:
                                            getProportionateScreenWidth(18.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.lightGreen,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                            child: Text(
                                          state.totalProductCount.message
                                              .toString(),
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      12.0)),
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
                                  color: Colors.transparent,
                                  shape: BoxShape.circle),
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
                                                getProportionateScreenWidth(
                                                    12.0)),
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
                      //SearchButton
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.search,
                          size: getProportionateScreenWidth(25),
                          color: Colors.white,
                        ),
                        tooltip: 'Search',
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: CustomSearchDelegate());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
