import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/ProductCategories/Category%201/product_categories.dart';
import 'package:unicorn_store/app_config.dart';

class MainCategory extends StatefulWidget {
  const MainCategory({Key? key}) : super(key: key);

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory> {
  @override
  Widget build(BuildContext context) {
    return _buildCategory(AppConfig.of(context).environment.name);
  }
}

Widget _buildCategory(String categoryType) {
  late Widget category;

  switch (categoryType) {
    case "dev":
      category = const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text("Category Page 1"),
        ),
      );
      break;
    case "prod":
      category = const ProductCategories();
      break;
    default:
  }

  return category;
}
