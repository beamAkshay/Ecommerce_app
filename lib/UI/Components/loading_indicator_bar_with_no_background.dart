import 'package:flutter/material.dart';

class LoadingIndicatorBarWithNoBackground extends StatelessWidget {
  const LoadingIndicatorBarWithNoBackground({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
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
