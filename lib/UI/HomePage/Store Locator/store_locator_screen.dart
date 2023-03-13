import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import '../../../Business_Logic/bloc/cart/total product count/total_product_count_bloc.dart';
import '../../../constant/constant.dart';
import '../../size_config.dart';
import '../Cart/add_to_cart.dart';

class StoreLocatorScreen extends StatefulWidget {
  const StoreLocatorScreen({Key? key}) : super(key: key);

  @override
  State<StoreLocatorScreen> createState() => _StoreLocatorScreenState();
}

class _StoreLocatorScreenState extends State<StoreLocatorScreen> {
  String? token;

  // carousal controller
  final CarouselController _controller = CarouselController();
  int currentPos = 0;
  List<String> listPaths = [
    "assets/storeImage.jpeg",
    "assets/adImage.jpeg",
    "assets/storeImage.jpeg",
  ];
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(
              //         horizontal: getProportionateScreenWidth(15.0)),
              //     child: Text("Mumbai Unicorn Store",
              //       style: TextStyle(
              //           fontSize: getProportionateScreenWidth(25.0),
              //           color: kDefaultHeaderFontColor)),
              // ),
              // ),

              CarouselSlider.builder(
                carouselController: _controller,
                options: CarouselOptions(
                  height: SizeConfig.screenHeight! * 0.35,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  },
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                ),
                itemCount: listPaths.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  //color: Colors.red,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(listPaths[itemIndex]),
                    width: double.infinity,
                    // height: getProportionateScreenHeight(200),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listPaths.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      currentPos == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),

              // const Image(
              //   height: 260.0,
              //   fit: BoxFit.fill,
              //   image: AssetImage("assets/storeImage.jpeg"),
              //   width: double.infinity,
              //   // height: getProportionateScreenHeight(200),
              // ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(15.0),
                              right: getProportionateScreenWidth(15.0),
                              bottom: 5.0),
                          child: Text("Address",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(20.0),
                                  color: kDefaultHeaderFontColor)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15.0),
                          ),
                          child: Text(
                              "001-002 Kotia Nirman, New Link Road, Near Fun Republic, Andheri West, Mumbai - 400053 Phone No. - 8879001592",
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14.0),
                                  height: 1.3,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.8))),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(15.0),
                              right: getProportionateScreenWidth(15.0),
                              top: 10.0,
                              bottom: 5.0),
                          child: Text("The Phone",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(20.0),
                                  color: kDefaultHeaderFontColor)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15.0),
                          ),
                          child: Text("9809098098",
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14.0),
                                  height: 1.3,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.8))),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(15.0),
                              right: getProportionateScreenWidth(15.0),
                              top: 10.0,
                              bottom: 5.0),
                          child: Text("Business hours",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(20.0),
                                  color: kDefaultHeaderFontColor)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15.0),
                          ),
                          child: Text("Mon-Thu:10am-6pm",
                              // textAlign: TextAlign.center,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14.0),
                                  height: 1.3,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.8))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15.0),
                ),
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Go to Google Maps",
                      style: TextStyle(fontSize: 16.0),
                    )),
              ),
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
      title: Text("Mumbai Unicorn Store",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20.0),
          )),

      actions: [
        Row(
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
                                color: Theme.of(context).colorScheme.onPrimary,
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
                                  fontSize: getProportionateScreenWidth(12.0)),
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
      ],
    );
  }
}
