// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/banner/banner_details_bloc.dart';
import 'package:unicorn_store/UI/ProductCategories/Category%201/list_of_specific_product.dart';
import '../../Business_Logic/bloc/category/category_bloc/category_api_fetch_bloc.dart';
import '../size_config.dart';
import '../../constant/constant.dart';
import 'Components/best_seller_product.dart';
import 'Components/header_text.dart';
import 'Components/hot_deals.dart';
import 'Components/outlined_button.dart';
import 'Components/smart_accessories.dart';
import 'Store Locator/search_store_screen.dart';
import 'Store Locator/store_locator_screen.dart';

class BestSeller {
  String title;
  String imgPath;
  BestSeller({required this.title, required this.imgPath});
}

class HotDealsList {
  String title;
  String imgPath;
  String price;
  String? cutPrice;
  String? discount;
  HotDealsList(
      {required this.title,
      required this.imgPath,
      required this.price,
      this.cutPrice,
      this.discount});
}

class SmartAccessoriesList {
  String title;
  String imgPath;
  SmartAccessoriesList({required this.title, required this.imgPath});
}

class HomePage extends StatefulWidget {
  static String id = "Home_Screen";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //static product for Best Seller
  List<BestSeller> bestSeller = [
    BestSeller(
        imgPath: "assets/BestSellerImages/macbook.jpeg",
        title: "13-inch MacBook Air: Apple M1 chip"),
    BestSeller(
        imgPath: "assets/BestSellerImages/iphone-11.jpeg", title: "iPhone 11"),
    BestSeller(
        imgPath: "assets/BestSellerImages/iphone-12mini.jpg",
        title: "iPhone 12 Mini"),
    BestSeller(
        imgPath: "assets/BestSellerImages/iphone-12.jpg", title: "iPhone 12"),
    BestSeller(
        imgPath: "assets/BestSellerImages/ipad-8th-g.jpg",
        title: "iPad 8th Generation"),
  ];

  //static product for hot deals
  List<HotDealsList> hotDeals = [
    HotDealsList(
        imgPath: "assets/HotDealsImages/iPhone7.jpg",
        title: "iPhone 7 128GB Black",
        price: "27900",
        cutPrice: "34900",
        discount: "20"),
    HotDealsList(
        imgPath: "assets/HotDealsImages/iPadAir.png",
        title: "10.5-inch iPad Air Wi-Fi 256GB - Silver",
        price: "50900",
        cutPrice: "58900",
        discount: "14"),
    HotDealsList(
        imgPath: "assets/HotDealsImages/iPhone-11-silver.jpeg",
        title: "iPhone 11 Pro Silver 64GB",
        price: "84900",
        cutPrice: "99900",
        discount: "15"),
    HotDealsList(
        imgPath: "assets/HotDealsImages/AppleWatchSeries5.jpeg",
        title:
            "Apple Watch Series 5 GPS 40mm Silver Aluminium Case with White Sport Band",
        price: "34500",
        cutPrice: "40900",
        discount: "16"),
  ];

  //static product for Smart Accessories
  List<SmartAccessoriesList> smartAccessoriesList = [
    SmartAccessoriesList(
        title: "AirPods Pro", imgPath: "assets/SmartAccessories/Airpod.jpeg"),
    SmartAccessoriesList(
        title:
            "Apple Watch Series 6 GPS, 44mm Gold Aluminium Case with Pink Sand Sport Band - Regular",
        imgPath: "assets/SmartAccessories/AppleWatchGold.jpeg"),
    SmartAccessoriesList(
        title: "AirTag (1 Pack)",
        imgPath: "assets/SmartAccessories/AirTag.jpg"),
    SmartAccessoriesList(
        title: "iPhone Leather Wallet with MagSafe - Wisteria",
        imgPath: "assets/SmartAccessories/iPhoneLeather.jpeg"),
    SmartAccessoriesList(
        title: "iPhone 13 Pro Silicone Case with MagSafe - Clover",
        imgPath: "assets/SmartAccessories/iPhone13SiliconeCase.jpeg"),
  ];

  //Creating object for category bloc
  final CategoryApiFetchBloc _categoryApiFetchBloc = CategoryApiFetchBloc();
  final BannerDetailsBloc bannerDetailsBloc = BannerDetailsBloc();

  // carousal controller
  final CarouselController _controller = CarouselController();
  int currentPos = 0;
  List<String> listPaths = [
    "assets/adImage.jpeg",
    "assets/macbook.jpg",
    "assets/adImage.jpeg",
  ];

  @override
  void initState() {
    //  AddressManagerDetailsApi().getCountryList();
    //  AddressManagerDetailsApi().getStateList("1")
    _categoryApiFetchBloc.add(LoadCategoryApiFetch());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Loading widet..................");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _categoryApiFetchBloc,
        ),
        BlocProvider(
          create: (context) => bannerDetailsBloc,
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              carouselController: _controller,
              options: CarouselOptions(
                height: 450,

                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;
                  });
                },

                // aspectRatio: 1 / 1,
                // viewportFraction: 0.8,
                // initialPage: 0,
                // enableInfiniteScroll: true,
                // reverse: false,
                autoPlay: true,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                viewportFraction: 1.0,
                enlargeCenterPage: false,

                // enlargeFactor: 0.3,
                // // onPageChanged: callbackFunction,
                // scrollDirection: Axis.horizontal,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: listPaths.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(currentPos == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),

            BlocBuilder<CategoryApiFetchBloc, CategoryApiFetchState>(
              builder: (context, state) {
                if (state is CategoryApiFetchLoaded) {
                  return SizedBox(
                    height: 130,
                    //  margin: EdgeInsets.only(top: 10.0),
                    child: Card(
                      elevation: 0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state.category.length,
                        itemBuilder: ((context, index) {
                          print("What is the problem is");
                          // WidgetsBinding.instance.addPostFrameCallback((_) {
                          //   if (_controller.hasClients) {
                          //     _controller
                          //         .animateTo(
                          //             _controller.position.maxScrollExtent,
                          //             duration: Duration(seconds: 5),
                          //             curve: Curves.ease)
                          //         .then((value) async {
                          //       await Future.delayed(Duration(seconds: 2));
                          //       _controller.animateTo(
                          //           _controller.position.minScrollExtent,
                          //           duration: Duration(seconds: 5),
                          //           curve: Curves.ease);
                          //     });
                          //   }
                          // });
                          return GestureDetector(
                            onTap: (() {
                              Navigator.pushNamed(
                                  context, ListOfSpecificProduct.id,
                                  arguments: {
                                    "categorySlug": state.category[index].slug,
                                    "homeScreen": true,
                                    // "filterProductList": state.filterProductList,
                                    // "selectedAttributeData":
                                    //     state.selectedAttributesData,
                                    // "selectedCheckboxAttributes":
                                    //     selectedAttributeValue,
                                    // "checkedAttribute": checkedAttribute,
                                    // "selectedItemList": selectedItemList
                                  });
                            }),
                            child: Container(
                              width: 110,
                              padding: const EdgeInsets.only(
                                  //left: 12.0,
                                  // right: 12.0,
                                  top: 10,
                                  bottom: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    //  backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage(
                                        "///categories/small/${state.category[index].image}"),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      state.category[index].name!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
            //Best sellers
            HeaderText(header: "BEST SELLERS"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0),
              height: getProportionateScreenHeight(300),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestSeller.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BestSellersProduct(
                      title: bestSeller[index].title,
                      imgPath: bestSeller[index].imgPath);
                },
              ),
            ),

            //Buy New
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(930),
              margin: EdgeInsets.only(top: getProportionateScreenHeight(15.0)),
              color: Colors.white,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(15.0),
                        bottom: getProportionateScreenHeight(5.0)),
                    child: Text("BUY NEW",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(25.0),
                            color: kDefaultHeaderFontColor)),
                  ),
                  Container(
                    margin: EdgeInsets.all(getProportionateScreenWidth(10.0)),
                    color: Colors.grey[300],
                    height: getProportionateScreenHeight(150),
                  ),
                  Container(
                    margin: EdgeInsets.all(getProportionateScreenWidth(10.0)),
                    color: Colors.grey[300],
                    height: getProportionateScreenHeight(150),
                  ),

                  Divider(
                    color: kDefaultBorderColor,
                    thickness: 1,
                  ),

                  //Hot Deals
                  // ignore: prefer_const_literals_to_create_immutables
                  Column(
                    children: [
                      HeaderText(header: "HOT DEALS"),
                      Container(
                        height: getProportionateScreenHeight(380),
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.builder(
                          itemCount: hotDeals.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HotDeals(
                              title: hotDeals[index].title,
                              imgPath: hotDeals[index].imgPath,
                              price: hotDeals[index].price,
                              discount: hotDeals[index].discount,
                              cutPrice: hotDeals[index].cutPrice,
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //Smart Accessories
            Container(
              margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(15.0),
                  right: getProportionateScreenWidth(15.0),
                  bottom: getProportionateScreenHeight(15.0)),
              child: Column(
                children: [
                  HeaderText(header: "SMART ACCESSORIES"),
                  SizedBox(
                    height: getProportionateScreenWidth(250),
                    child: ListView.builder(
                      itemCount: smartAccessoriesList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SmartAccessories(
                          title: smartAccessoriesList[index].title,
                          imgPath: smartAccessoriesList[index].imgPath,
                          onPress: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //Store locator
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(15.0)),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchStoreScreen();
                  }));
                },
                child: Text("Store Locator >",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(20.0),
                        color: kDefaultHeaderFontColor)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return StoreLocatorScreen();
                }));
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10.0)),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    Image(
                      height: 260,

                      fit: BoxFit.fill,
                      image: AssetImage("assets/storeImage.jpeg"),
                      width: double.infinity,
                      // height: getProportionateScreenHeight(200),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15.0)),
                      child: Text("Mumbai Unicorn Store",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(22.0),
                              color: kDefaultHeaderFontColor)),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15.0),
                      ),
                      child: Text(
                          "001-002 Kotia Nirman, New Link Road, Near Fun Republic, Andheri West, Mumbai - 400053 Phone No. - 8879001592",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14.0),
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.8))),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   padding: EdgeInsets.all(2.0),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(3.0),
                        //       color: Color(0xFFD2FCD4),
                        //       border: Border.all(color: Colors.green[800]!)),
                        //   child: Text(
                        //     "Nearest",
                        //     style: TextStyle(
                        //         color: Colors.green[800], fontSize: 12),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 15.0,
                        // ),
                        Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.1),
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          child: Text(
                            "Unicorn Flagship store",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 12),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            )

            // //Trade-In And Personal Shopper
            // Column(
            //   children: [
            //     //TRADE-IN / BUY BACK
            //     Container(
            //       width: double.infinity,
            //       color: Colors.white,
            //       padding: EdgeInsets.all(getProportionateScreenWidth(15.0)),
            //       child: Column(
            //         children: [
            //           Image(
            //             image: AssetImage("assets/trade-in.png"),
            //             width: getProportionateScreenWidth(110.0),
            //             height: getProportionateScreenHeight(110.0),
            //           ),
            //           Text("TRADE-IN / BUY BACK",
            //               style: TextStyle(
            //                   fontSize: getProportionateScreenWidth(20.0),
            //                   color: kDefaultHeaderFontColor)),
            //           Container(
            //             margin: EdgeInsets.only(
            //                 top: getProportionateScreenHeight(10.0)),
            //             child: Text(
            //               "Take your old iPhone, Mac or iPad to your local unicorn  store and get instant in-store credit towards the purchase of a new Apple device.",
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   height: 1.5,
            //                   fontSize: getProportionateScreenWidth(14.0),
            //                   color: kDefaultTitleColor),
            //             ),
            //           ),
            //           SizedBox(
            //             height: getProportionateScreenHeight(15.0),
            //           ),
            //           OutlinedButtonContainer(
            //             title: "Learn More",
            //             //width: getProportionateScreenWidth(105.0),
            //             height: getProportionateScreenHeight(33.0),
            //           ),
            //         ],
            //       ),
            //     ),

            //     //Personal Shopper
            //     Container(
            //       width: double.infinity,
            //       color: Colors.white,
            //       padding: EdgeInsets.all(getProportionateScreenWidth(20.0)),
            //       child: Column(
            //         children: [
            //           Image(
            //             image: AssetImage("assets/personal-shopper.png"),
            //             width: getProportionateScreenWidth(110.0),
            //             height: getProportionateScreenHeight(110.0),
            //           ),
            //           Text("PERSONAL SHOPPER",
            //               style: TextStyle(
            //                   fontSize: getProportionateScreenWidth(20.0),
            //                   color: kDefaultHeaderFontColor)),
            //           Container(
            //             margin: EdgeInsets.only(
            //                 top: getProportionateScreenHeight(10.0)),
            //             child: Text(
            //               "An online appointment service where you can book a consultation with your personal Apple Expert from Unicorn Store.",
            //               textAlign: TextAlign.center,
            //               style: TextStyle(
            //                   height: 1.5,
            //                   fontSize: getProportionateScreenWidth(14.0),
            //                   color: kDefaultTitleColor),
            //             ),
            //           ),
            //           SizedBox(
            //             height: getProportionateScreenHeight(15.0),
            //           ),
            //           OutlinedButtonContainer(
            //             title: "Book Now",
            //             width: getProportionateScreenWidth(105.0),
            //             height: getProportionateScreenHeight(33.0),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

            // //Newsletter
            // Container(
            //   margin: EdgeInsets.symmetric(
            //       vertical: getProportionateScreenHeight(25.0)),
            //   padding: EdgeInsets.symmetric(
            //       horizontal: getProportionateScreenWidth(15.0)),
            //   child: Column(
            //     children: [
            //       Text("NEWSLETTER",
            //           style: TextStyle(
            //               fontSize: getProportionateScreenWidth(20.0),
            //               color: kDefaultHeaderFontColor)),
            //       SizedBox(
            //         height: getProportionateScreenHeight(10.0),
            //       ),
            //       Text(
            //         "GET WEEKLY UPDATES BY SUBSCRIBING TO OUR NEWSLETTER",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //             height: 1.5,
            //             color: kDefaultTitleColor,
            //             fontSize: getProportionateScreenWidth(15.0)),
            //       ),
            //       SizedBox(
            //         height: getProportionateScreenHeight(20.0),
            //       ),
            //       Text(
            //         "Receive updates on news, events and special offers via email newsletter.",
            //         style: TextStyle(
            //             fontSize: getProportionateScreenWidth(14.0),
            //             height: 1.5),
            //         textAlign: TextAlign.center,
            //       ),
            //       SizedBox(
            //         height: getProportionateScreenHeight(15.0),
            //       ),

            //       //NEWSLETTER SEARCH BOX WITH BUTTON
            //       Stack(clipBehavior: Clip.none, children: [
            //         Container(
            //           color: Colors.white,
            //           width: getProportionateScreenWidth(350),
            //           height: getProportionateScreenHeight(40),
            //           child: TextFormField(
            //             cursorColor: Colors.black,
            //             decoration: InputDecoration(
            //               hintStyle: TextStyle(
            //                   color: Color(0xFF6C757D),
            //                   fontSize: getProportionateScreenWidth(13.0)),
            //               hintText: "Enter Your Email Address",
            //               contentPadding: EdgeInsets.all(
            //                   getProportionateScreenWidth(
            //                       getProportionateScreenWidth(7.0))),
            //               border: OutlineInputBorder(
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(5.0))),
            //               enabledBorder: OutlineInputBorder(
            //                 borderSide: BorderSide(
            //                     color: kDefaultBorderColor, width: 1.0),
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(5.0)),
            //               ),
            //               focusedBorder: OutlineInputBorder(
            //                 borderSide: BorderSide(
            //                     color: Color(0xFF1F99CF), width: 1.0),
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(5.0)),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Positioned(
            //           right: 0,
            //           child: SizedBox(
            //               // width: getProportionateScreenWidth(115),
            //               height: getProportionateScreenHeight(40),
            //               child: ElevatedButton(
            //                 onPressed: () {},
            //                 style: ElevatedButton.styleFrom(
            //                   backgroundColor: Color(0xFF1F99CF), // background
            //                   foregroundColor: Colors.white,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.only(
            //                         topRight: Radius.circular(5.0),
            //                         bottomRight:
            //                             Radius.circular(5.0)), // <-- Radius
            //                   ), // foreground
            //                 ),
            //                 child: Text(
            //                   "SUBSCRIBE",
            //                   style: TextStyle(
            //                       fontSize: getProportionateScreenWidth(15.0)),
            //                 ),
            //               )),
            //         ),
            //       ]),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
