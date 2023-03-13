// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/cart/empty%20cart/empty_cart_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/checkout/payment%20order%20status/payment_order_status_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/UI/Components/loading_indicator_bar.dart';
import 'package:unicorn_store/UI/main_screen.dart';
import 'package:unicorn_store/UI/size_config.dart';

import '../../Order History/product_history.dart';

class PaymentSuccess extends StatefulWidget {
  final String order_id;
  final String token;
  const PaymentSuccess({Key? key, required this.order_id, required this.token})
      : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  PaymentOrderStatusBloc paymentOrderStatusBloc = PaymentOrderStatusBloc();
  EmptyCartBloc emptyCartBloc = EmptyCartBloc();

  LoginData? loginData;

  @override
  void initState() {
    super.initState();
    emptyCartBloc.add(EmptyCart(widget.token));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => paymentOrderStatusBloc
        ..add(LoadPaymentOrderStatus(widget.order_id, widget.token)),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                loginData = state.loginData;
              }
              return SafeArea(
                  child: BlocListener<PaymentOrderStatusBloc,
                      PaymentOrderStatusState>(
                listener: (context, state) {
                  if (state is PaymentOrderStatusActive) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(selectedIndex: 0),
                        ));
                  }
                },
                child: BlocBuilder<PaymentOrderStatusBloc,
                    PaymentOrderStatusState>(
                  builder: (context, state) {
                    if (state is PaymentOrderStatusLoading) {
                      return const LoadingIndicatorBar();
                    }
                    if (state is PaymentOrderStatusPaid) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(150),
                            ),
                            Container(
                              height: 100.0,
                              width: 100.0,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFB1AFAF)
                                          .withOpacity(0.5),
                                      blurRadius: 5.0,
                                      spreadRadius: 5.0,
                                      offset: const Offset(1, 1),
                                    )
                                  ],
                                  shape: BoxShape.circle),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 45.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(50),
                            ),
                            const Text(
                              "Order Placed!!!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Your order has been successfully placed!",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainScreen(selectedIndex: 0),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text("Continue Shopping")),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ProductHistory.id,
                                      arguments: {"loginData": loginData});
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green),
                                child: const Text("View Order")),
                          ],
                        ),
                      );
                    }
                    if (state is PaymentOrderStatusFailure) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(150),
                            ),
                            Container(
                              height: 100.0,
                              width: 100.0,
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFB1AFAF)
                                          .withOpacity(0.5),
                                      blurRadius: 5.0,
                                      spreadRadius: 5.0,
                                      offset: const Offset(1, 1),
                                    )
                                  ],
                                  shape: BoxShape.circle),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 45.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(50),
                            ),
                            const Text(
                              "Failed!!!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Your order has not been placed!",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainScreen(selectedIndex: 0),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue),
                                child: const Text("Continue Shopping")),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ));
            },
          ),
        ),
      ),
    );
  }
}
