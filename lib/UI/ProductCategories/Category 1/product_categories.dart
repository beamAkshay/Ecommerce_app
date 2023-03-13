import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/category/category_bloc/category_api_fetch_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/Data/Models/Category/NewCategory/category_data.dart';
import 'package:unicorn_store/UI/Components/linear_indicator.dart';
import 'package:unicorn_store/UI/ProductCategories/Category%201/list_of_children.dart';
import 'package:unicorn_store/UI/size_config.dart';
import '../../../constant/constant.dart';

class ProductCategories extends StatefulWidget {
  static String id = "ProductCategories_Screen";

  const ProductCategories({Key? key}) : super(key: key);

  @override
  State<ProductCategories> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<ProductCategories>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  int? selected = 0;
  String? categoryName;

  //Creating object for category bloc
  final CategoryApiFetchBloc _categoryApiFetchBloc = CategoryApiFetchBloc();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  //Fade animation controller
  late final AnimationController _fadeController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..forward();
  late final Animation<double> _fadeAnimation =
      Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: _fadeController,
    curve: Curves.easeInOut,
  ));

  //Load Category
  List<CategoryData>? cat;

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  String? token;

  @override
  void initState() {
    _categoryApiFetchBloc.add(LoadCategoryApiFetch());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          token = state.loginData.userData!.token;
        } else if (state is AuthenticationUnauthenticated) {
          token = "";
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MultiBlocProvider(
                  providers: [
                    BlocProvider<CategoryApiFetchBloc>(
                      create: (BuildContext context) => _categoryApiFetchBloc,
                    ),
                  ],
                  child:
                      BlocListener<CategoryApiFetchBloc, CategoryApiFetchState>(
                    listener: (context, state) {
                      if (state is CategoryApiFetchLoaded) {
                        setState(() {
                          cat = state.category;
                        });
                      } else if (state is CategoryApiFetchError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message!),
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<CategoryApiFetchBloc,
                        CategoryApiFetchState>(
                      builder: (context, state) {
                        if (state is CategoryApiFetchLoading) {
                          return const LinearIndicatorBar();
                        }
                        if (state is CategoryApiFetchLoaded) {
                          return _buildCategory(state.category);
                        } else if (state is CategoryApiFetchError) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      (MediaQuery.of(context).size.height / 3)),
                              child: const Text("No Category Found"),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //List of categories
  Widget _buildCategory(List<CategoryData> category) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),
          Text("   Categories",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(25.0),
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.8))),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),
          // Divider(
          //   color: Theme.of(context).colorScheme.outline,
          //   thickness: 1,
          // ),
          ListView.builder(
            key: Key('builder ${selected.toString()}'),
            shrinkWrap: true,
            itemCount: category.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(10.0)),
                color: Theme.of(context).colorScheme.secondaryContainer,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.only(
                        left: getProportionateScreenWidth(40.0),
                        right: getProportionateScreenWidth(40.0),
                        bottom: getProportionateScreenHeight(20.0),
                        top: getProportionateScreenHeight(20.0)),

                    // ignore: avoid_unnecessary_containers
                    trailing: CachedNetworkImage(
                        imageUrl:
                            "$categoryImageUrl/categories/small/${category[index].image}",
                        placeholder: (context, url) => const SizedBox(
                              height: 50,
                              width: 50,
                            ),
                        errorWidget: (context, url, error) {
                          return const Image(image: AssetImage(errorImageUrl));
                        }),
                    initiallyExpanded:
                        isExpanded && index == selected, //attention
                    onExpansionChanged: (state) async {
                      if (state) {
                        _controller.forward();
                        setState(() {
                          isExpanded = state;
                          selected = index;
                        });
                        if (_controller.isCompleted) {
                          _controller.reset();
                          print(_controller.status);
                          _controller.forward();
                        }
                      } else {
                        log(state.toString());
                        setState(() {
                          selected = -1;
                        });
                      }
                    },
                    title: Row(
                      children: [
                        Flexible(
                          child: Text(
                            category[index].name.toString(),
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18.0),
                                // overflow: TextOverflow.ellipsis,
                                color: (isExpanded && selected == index)
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.8)),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5.0)),
                        (isExpanded && selected == index)
                            ? RotatedBox(
                                quarterTurns: 135,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: getProportionateScreenHeight(12.0),
                                  color: Theme.of(context).colorScheme.primary,
                                ))
                            : RotatedBox(
                                quarterTurns: 45,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: getProportionateScreenHeight(12.0),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.8),
                                )),
                      ],
                    ),
                    children: [buildSubcategories(category[index].children!)],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  //List of Subcategories
  Widget buildSubcategories(List<CategoryData> subcategoryList) {
    if (subcategoryList.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(bottom: 60.0),
        margin: const EdgeInsets.only(top: 30),
        child: const Text("No Subcategory Found."),
      );
    }
    return SizeTransition(
      sizeFactor: _animation,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: subcategoryList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(25.0),
                  right: getProportionateScreenWidth(25.0),
                  bottom: (subcategoryList.length - 1 == index) ? 10.0 : 0.0),
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, ListOfChildren.id,
                            arguments: {
                              "id": subcategoryList[index].id.toString(),
                              "name": subcategoryList[index].name.toString(),
                              "subcategoryData":
                                  subcategoryList[index].children,
                              "token": token,
                            });
                      },
                      title: Text(
                        subcategoryList[index].name.toString(),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(15.0),
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.8),
                        ),
                      ),
                      dense: true,
                    ),
                  ),
                  (subcategoryList.length - 1 == index)
                      ? const SizedBox()
                      : Divider(
                          color: Theme.of(context).colorScheme.outline,
                          thickness: 1,
                        ),
                ],
              ),
            );
          }),
    );
  }
}
