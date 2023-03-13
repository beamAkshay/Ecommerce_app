import 'package:flutter/material.dart';
import '../../size_config.dart';

class BestSellersProduct extends StatelessWidget {
  const BestSellersProduct(
      {Key? key, required this.title, required this.imgPath})
      : super(key: key);

  final String title;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
     //   Navigator.pushNamed(context, ProductDetailsScreen.id);
      },
      child: Container(
        width: getProportionateScreenWidth(290.0),
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 15.0,
          right: 15.0,
          bottom: 30.0,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Flexible(
              child: Image(
                image: AssetImage(imgPath),
              ),
            ),
           const SizedBox(height:5.0),
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(fontSize: getProportionateScreenWidth(15.0),overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
