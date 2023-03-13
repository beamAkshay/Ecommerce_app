// ignore_for_file: use_build_context_synchronously

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';
import 'OnBoarding Screen/on_boarding_page.dart';

class InitialScreen extends StatefulWidget {
  static String id = "Initial_Screen";
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen>
    with AfterLayoutMixin<InitialScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool seen = (prefs.getBool('seen') ?? false);

    if (seen) {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacementNamed(context, OnBoardingPage.id);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
