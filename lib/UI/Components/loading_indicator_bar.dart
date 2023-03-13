import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingIndicatorBar extends StatelessWidget {
  const LoadingIndicatorBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 5.0,
            color: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
