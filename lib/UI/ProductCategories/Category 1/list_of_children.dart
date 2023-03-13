import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unicorn_store/Data/Models/Category/NewCategory/category_data.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/ProductPage/product_type_page.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../../constant/constant.dart';

class ListOfChildren extends StatefulWidget {
  static String id = "ListOfChildren";

  const ListOfChildren({Key? key}) : super(key: key);

  @override
  State<ListOfChildren> createState() => _ListOfChildrenState();
}

class _ListOfChildrenState extends State<ListOfChildren> {
  // ignore: prefer_typing_uninitialized_variables
  var accessoriesData;

  List<CategoryData>? accessoriesChildren;

  @override
  Widget build(BuildContext context) {
    accessoriesData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    accessoriesChildren = accessoriesData["subcategoryData"];
    return Scaffold(
      appBar: const BuildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenHeight(15.0)),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(accessoriesData["name"],
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(25.0),
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.8),
                          )),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 1,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15.0),
                ),
                _buildAccessoriesChild(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccessoriesChild() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: accessoriesChildren!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (accessoriesChildren![index].children!.isNotEmpty) {
                Navigator.pushNamed(context, ListOfChildren.id, arguments: {
                  "name": accessoriesChildren![index].name!,
                  "subcategoryData": accessoriesChildren![index].children,
                  "token": accessoriesData["token"]
                });
              } else {
                Navigator.pushNamed(context, ProductDetailsScreen.id,
                    arguments: {
                      "productTypeSlug": accessoriesChildren![index].slug,
                      "filterProductData": false,
                    });
              }
            },
            child: Column(
              children: [
                CachedNetworkImage(
                    height: getProportionateScreenHeight(180),
                    width: getProportionateScreenWidth(180),
                    imageUrl:
                        "$imageDefaultURL/product/medium/${accessoriesChildren![index].image}",
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) =>
                        const Image(image: AssetImage(errorImageUrl))),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                Text(
                  accessoriesChildren![index].name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18.0),
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outline,
                  thickness: 1,
                ),
              ],
            ),
          );
        });
  }
}
