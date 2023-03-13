import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unicorn_store/UI/My%20Account/Checkout%20Page/Components/payment_success.dart';
import 'package:unicorn_store/constant/constant.dart';
import 'package:unicorn_store/UI/main_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String url;
  final String orderId;
  final String token;
  const PaymentScreen(
      {Key? key, required this.url, required this.orderId, required this.token})
      : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    log(widget.url);
    return WillPopScope(
      onWillPop: () async {
        bool? result = await _backButtonAlert(context);
        result ??= false;
        return result;
      },
      child: Scaffold(
        body: SafeArea(
          child: WebView(
            initialUrl: widget.url,
            onPageFinished: (url) {
              //   print(url);
            },
            onWebResourceError: (error) {
              print(error);
            },
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith(
                  'http://mum01.beaminnovate.com/bics-front-build-live/#/checkout')) {
                print('blocking navigation to $request}');
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => PaymentSuccess(
                              order_id: widget.orderId,
                              token: widget.token,
                            ))));
                return NavigationDecision.navigate;
              }
              return NavigationDecision.navigate;
            },
          ),
        ),
      ),
    );
  }

  Future<bool?> _backButtonAlert(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text(
          'Confirm Exit',
          textAlign: TextAlign.left,
        ),
        content: const Text('Are you sure you want to exit?'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kDefaultSecondaryButtonColor,
            ),
            onPressed: () => Navigator.pop(c, false),
            child: const Text('No'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kDefaultSecondaryButtonColor,
            ),
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(selectedIndex: 0),
                  ));
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
