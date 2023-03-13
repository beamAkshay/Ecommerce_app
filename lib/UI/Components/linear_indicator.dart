import 'package:flutter/material.dart';

class LinearIndicatorBar extends StatefulWidget {
  const LinearIndicatorBar({
    Key? key,
  }) : super(key: key);

  @override
  State<LinearIndicatorBar> createState() => _LinearIndicatorBarState();
}

class _LinearIndicatorBarState extends State<LinearIndicatorBar> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 5,
      color: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
