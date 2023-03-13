

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/Components/loading_indicator_bar.dart';

class CupertinoLoadingIndicator extends StatelessWidget {
  const CupertinoLoadingIndicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicatorBar();
  }
}