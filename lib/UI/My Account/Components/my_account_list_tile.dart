import 'package:flutter/material.dart';

import '../../size_config.dart';

class MyAccountListTile extends StatelessWidget {
  final String header;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Function onTap;
  const MyAccountListTile(
      {Key? key,
      required this.header,
      this.leadingIcon,
      this.trailingIcon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: getProportionateScreenHeight(30.0),
        ),
        title: Text(
          header,
          style: TextStyle(fontSize: getProportionateScreenWidth(15.0)),
        ),
        trailing: Icon(
          trailingIcon,
          size: getProportionateScreenHeight(20.0),
        ),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
