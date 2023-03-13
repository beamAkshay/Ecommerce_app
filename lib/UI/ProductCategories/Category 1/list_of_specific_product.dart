// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/filter%20product/filter_product_atrributes_bloc.dart';
import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20List/filter_product_details.dart';
import 'package:unicorn_store/Data/Models/Filter/Filter%20Product%20List/filter_product_list.dart';
import 'package:unicorn_store/UI/Components/image_path.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/HomePage/Components/price_tag.dart';
import 'package:unicorn_store/UI/ProductCategories/Category%201/filter_screen.dart';
import 'package:unicorn_store/UI/ProductPage/product_type_page.dart';
import 'package:unicorn_store/constant/constant.dart';
import 'package:unicorn_store/UI/main_screen.dart';
import '../../../Business_Logic/bloc/filter product/filter_product_list/filter_product_list_bloc.dart';
import '../../size_config.dart';

class SortingAttributes {
  String name;
  String sortingValue;

  SortingAttributes(this.name, this.sortingValue);

  @override
  String toString() =>
      'SortingAttributes(name: $name, sortingValue: $sortingValue)';
}

class ListOfSpecificProduct extends StatefulWidget {
  static String id = "ListOfSpecificProduct";
  const ListOfSpecificProduct({Key? key}) : super(key: key);

  @override
  State<ListOfSpecificProduct> createState() => _ListOfSpecificProductState();
}

class _ListOfSpecificProductState extends State<ListOfSpecificProduct> {
  // ignore: prefer_typing_uninitialized_variables
  var subcategoryData;
  FilterProductList? filterProductList;
  List<FilterProductDetails>? filterProductDetails;

  //save sorting data
  Map<String, String> sortingData = {};

  //Selected attribute data
  Map<String, bool>? selectedAttributeValue;

  //Show count of selected Item in filter
  Map<String, int>? selectedItemList;

  //This list for count checked attributes
  List<SelectAttributes> checkedAttribute = [];

  //selected Attribute data
  Map<String, dynamic> selectedAttributeData = {};

  //Category name
  String? categorySlug;

  //creating instance of bloc
  FilterProductListBloc filterProductListBloc = FilterProductListBloc();
  //Creating instance for filter bloc
  FilterProductAtrributesBloc filterProductAtrributesBloc =
      FilterProductAtrributesBloc();

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void didChangeDependencies() {
    subcategoryData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    if (subcategoryData["homeScreen"] == false) {
      //  print("data");
      filterProductList = subcategoryData["filterProductList"];
      filterProductDetails = filterProductList!.data;
      selectedAttributeData = subcategoryData["selectedAttributeData"];
      selectedAttributeValue = subcategoryData["selectedCheckboxAttributes"];
      categorySlug = subcategoryData["categorySlug"];

      //This is for no of filter attribites count
      checkedAttribute = subcategoryData["checkedAttribute"];
      selectedItemList = subcategoryData["selectedItemList"];
    } else {
      categorySlug = subcategoryData["categorySlug"];
      selectedAttributeData = {
        "limit_per_page": "100",
        "order_by": "name",
        "skip": "0",
        "sort": "0",
        "filter_text": ""
      };
      filterProductAtrributesBloc
          .add(LoadFilterAttributes(selectedAttributeData, categorySlug!));
    }

    // print("List of Product Page Data: $selectedAttributeValue");
    // print(selectedItemList!.length);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // if (wishlistBackbuttonFlag) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainScreen(
            selectedIndex: 0,
          );
        }));
        //   return false;
        // }
        // Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: const BuildAppBar(),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => filterProductListBloc),
            BlocProvider(create: (context) => filterProductAtrributesBloc),
          ],
          child: SafeArea(
            child: subcategoryData["homeScreen"]
                ? BlocConsumer<FilterProductAtrributesBloc,
                    FilterProductAtrributesState>(
                    listener: (context, state) {
                      if (state is FilterProductAtrributesLoaded) {
                        setState(() {
                          filterProductDetails = state.filterData.data;
                        });

                        viewCartProductAnalyticsEvent();
                      }
                    },
                    builder: (context, state) {
                      if (state is FilterProductAtrributesLoading) {
                        return const LinearIndicatorBar();
                      }
                      if (state is FilterProductAtrributesLoaded) {
                        filterProductDetails = state.filterData.data;

                        return BlocConsumer<FilterProductListBloc,
                            FilterProductListState>(
                          listener: (context, state) {
                            if (state is FilterProductListLoaded) {
                              setState(() {
                                filterProductDetails =
                                    state.filterProductList.data;
                              });
                            }
                          },
                          builder: (context, state) {
                            if (state is FilterProductListLoading) {
                              return const LinearIndicatorBar();
                            }
                            if (state is FilterProductListLoaded) {
                              filterProductDetails =
                                  state.filterProductList.data;

                              return _buildProductList();
                            }
                            return _buildProductList();
                          },
                        );
                      }
                      if (state is FilterProductAtrributesFailure) {
                        return const Center(
                            child: Text("Products are not available"));
                      }
                      return Container();
                    },
                  )
                : BlocConsumer<FilterProductListBloc, FilterProductListState>(
                    listener: (context, state) {
                      if (state is FilterProductListLoaded) {
                        setState(() {
                          filterProductDetails = state.filterProductList.data;
                        });
                      }
                    },
                    builder: (context, state) {
                      if (state is FilterProductListLoading) {
                        return const LinearIndicatorBar();
                      }
                      if (state is FilterProductListLoaded) {
                        filterProductDetails = state.filterProductList.data;

                        return _buildProductList();
                      }
                      return _buildProductList();
                    },
                  ),
          ),
        ),
      ),
    );
  }

  //List of Product
  Widget _buildProductList() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20.0), vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).colorScheme.outline))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PopupMenuButton(
                        position: PopupMenuPosition.under,
                        offset: const Offset(10, 15),
                        onSelected: (SortingAttributes sortingValue) {
                          setState(() {
                            selectedAttributeData.update(
                                "order_by", (value) => sortingValue.name);
                            selectedAttributeData.update(
                                "sort", (value) => sortingValue.sortingValue);
                          });

                          filterProductListBloc.add(LoadFilterProductList(
                              selectedAttributeData, false, categorySlug!));
                        },
                        itemBuilder: (BuildContext context) => [
                              PopupMenuItem<SortingAttributes>(
                                value: SortingAttributes("name", "1"),
                                child: const Text('Name: A to Z'),
                              ),
                              PopupMenuItem<SortingAttributes>(
                                value: SortingAttributes("name", "0"),
                                child: const Text('Name: Z to A'),
                              ),
                              PopupMenuItem<SortingAttributes>(
                                value: SortingAttributes("price", "1"),
                                child: const Text('Price: Low to High'),
                              ),
                              PopupMenuItem<SortingAttributes>(
                                value: SortingAttributes("price", "0"),
                                child: const Text('Price: High to Low'),
                              ),
                            ],
                        child: SizedBox(
                          height: 35.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sort_rounded,
                                size: 22,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text("Sort",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(16.0),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                            ],
                          ),
                        )),
                  ),
                  const VerticalDivider(
                    color: kDefaultBorderColor,
                    indent: 8.0,
                    endIndent: 8.0,
                    thickness: 1,
                  ),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return FilterScreen(
                            selectedAttributeValue: selectedAttributeValue,
                            categorySlug: categorySlug,
                            checkedAttribute: checkedAttribute,
                            selectedItemList: selectedItemList,
                            totalCount: subcategoryData["homeScreen"]
                                ? "0"
                                : filterProductList!.total_count.toString(),
                          );
                        }));
                      },
                      icon: Icon(
                        Icons.filter_list_rounded,
                        size: 22,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      label: Text("Filter",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16.0),
                              color:
                                  Theme.of(context).colorScheme.onBackground)),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: getProportionateScreenHeight(10.0),
          ),

          //List of Products
          Expanded(
            child: ListView.builder(
                itemCount: filterProductDetails!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProductDetailsScreen.id,
                          arguments: {
                            "filterProductData": true,
                            "productTypeSlug":
                                filterProductDetails![index].slug,
                          });
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenWidth(15.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15.0)),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
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
                              height: getProportionateScreenHeight(200),
                              width: getProportionateScreenWidth(200),
                              imageUrl:
                                  "$categoryImageUrl/product/medium/${ImagePath.getPrimaryImageSrc(filterProductDetails![index].images ?? [])}",
                              placeholder: (context, url) => Container(),
                              errorWidget: (context, url, error) => const Image(
                                  image: AssetImage(errorImageUrl))),
                          SizedBox(
                            height: getProportionateScreenHeight(15.0),
                          ),
                          Text(
                            filterProductDetails![index].name ?? " ",
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(15.0),
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15.0),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   'Starting from',
                              //   style: TextStyle(
                              //       fontSize: getProportionateScreenWidth(15.0),
                              //       color: kDefaultTitleFontColor),
                              // ),
                              // SizedBox(
                              //   width: getProportionateScreenWidth(10.0),
                              // ),
                              PriceTag(
                                price: filterProductDetails![index]
                                    .price
                                    .toString(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15.0),
                          ),
                          // (subcategoryTypes[index].saleprice !=
                          //             subcategoryTypes[index].price &&
                          //         subcategoryTypes[index].price != 0)
                          //     ? Column(
                          //         children: [
                          //           PriceTag(
                          //             price: subcategoryTypes[index]
                          //                 .price
                          //                 .toString(),
                          //             textDecoration:
                          //                 TextDecoration.lineThrough,
                          //             color: kDefaultTitleFontColor,
                          //           ),
                          //           SizedBox(
                          //             height:
                          //                 getProportionateScreenHeight(15.0),
                          //           ),
                          //           Text(
                          //             "${subcategoryTypes[index].discount}% off",
                          //             style: TextStyle(
                          //                 fontSize:
                          //                     getProportionateScreenWidth(15.0),
                          //                 color: Colors.green),
                          //           ),
                          //         ],
                          //       )
                          //     : Container(),
                          SizedBox(
                            height: getProportionateScreenHeight(20.0),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<void> viewCartProductAnalyticsEvent() async {
    List<AnalyticsEventItem> analyticsEvent = [];
    for (var element in filterProductDetails!) {
      analyticsEvent.add(AnalyticsEventItem(
          itemName: element.name,
          itemId: element.id.toString(),
          price: element.price));
    }
    await analytics
        .logViewItemList(
          itemListName: categorySlug,
          items: analyticsEvent,
        )
        .then((value) => print(
            "Analytics event for view list of product called successfully........"));
  }
}
