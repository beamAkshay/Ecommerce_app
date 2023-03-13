// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class NavigationDrawerListItem extends StatelessWidget {
  final String title;
  final Function onPress;

  const NavigationDrawerListItem(
      {Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // // padding:
      // //     EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10.0)),
      // decoration: const BoxDecoration(
      //   // border: Border(
      //   //   top: BorderSide(color: kDefaultBorderColor, width: 0),
      //   //   bottom: BorderSide(color: kDefaultBorderColor, width: 0),
      //   // ),
      // ),
      child: ListTile(
        title: Text(
          title,
          //style:  TextStyle(color: Colors.black54,fontSize: getProportionateScreenWidth(16.0)),
        ),
        onTap: () {
          onPress();
        },
      ),
    );
  }
}
