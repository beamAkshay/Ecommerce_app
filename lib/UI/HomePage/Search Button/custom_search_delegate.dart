import 'package:flutter/material.dart';
import '../../size_config.dart';
import '../../../constant/constant.dart';

class CustomSearchDelegate extends SearchDelegate<dynamic> {
  var allNames = ["Mac Book", "iPhone12", "iPhone13", "Apple Warch", "iPad"];

  var suggestion = ["iPhone12", "Apple Warch", "Mac Book"];
  List<String> searchResult = [];

  @override
  List<Widget> buildActions(BuildContext context) {
// this will show clear query button
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          size: getProportionateScreenWidth(25),
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
// adding a back button to close the search
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: getProportionateScreenWidth(25),
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
//clear the old search list
    searchResult.clear();

//find the elements that starts with the same query letters.
// allNames is a list that contains all your data ( you can replace it here by an http request or a query from your database )
    searchResult =
        allNames.where((element) => element.startsWith(query)).toList();

// view a list view with the search result
    return Container(
      margin:const EdgeInsets.all(20),
      child: ListView(
          padding:const EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(searchResult.length, (index) {
            var item = searchResult[index];
            return Card(
              color: Colors.white,
              child: Container(padding:const EdgeInsets.all(16), child: Text(item)),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    final suggestionList = query.isEmpty
        ? suggestion
        : allNames.where((element) => element.startsWith(query)).toList();
    return (query.isEmpty)
        ? const Text('')
        : Container(
            margin: const EdgeInsetsDirectional.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(25.0),
                        color: kDefaultHeaderFontColor)),
                const Divider(
                  color: kDefaultBorderColor,
                  thickness: 1,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: suggestionList.length,
                    itemBuilder: (context, index) => Container(
                      alignment: Alignment.topLeft,
                      child: Chip(
                          backgroundColor: const Color(0xFFEBEBEB),
                          label: Text(suggestionList[index])),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
