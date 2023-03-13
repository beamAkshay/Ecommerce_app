import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/UI/Components/loading_indicator_bar_with_no_background.dart';
import 'package:unicorn_store/UI/main_screen.dart';

class OnBoardingPage extends StatefulWidget {
  static String id = "OnBoardingPage";
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  late AuthenticationBloc authenticationBloc;

  void _onIntroEnd(context) {
    authenticationBloc.add(const SaveOnBoardingScreenData());
  }

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    FlutterNativeSplash.remove();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      //descriptionPadding: EdgeInsets.all(10),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationUnauthenticated) {
          Navigator.pushNamed(context, MainScreen.id);
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return const LoadingIndicatorBarWithNoBackground();
          }
          return IntroductionScreen(
            isTopSafeArea: true,
            key: introKey,
            globalBackgroundColor: Colors.white,

            globalFooter: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                child: const Text(
                  'Let\'s go right away!',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () => _onIntroEnd(context),
              ),
            ),

            pages: [
              PageViewModel(
                title: "Let the season be about you.",
                image: const Image(image: AssetImage("assets/test.png")),
                body: "Discover the accessories you wanted all along",
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Let the season be about you.",
                image: const Image(image: AssetImage("assets/test.png")),
                body: "Discover the accessories you wanted all along",
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "Welcome to Unicorn Store.",
                body: "",
                decoration: pageDecoration,
              ),
            ],
            onDone: () => _onIntroEnd(context),
            //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            //  skipFlex: 0,
            nextFlex: 0,
            //rtl: true, // Display as right-to-left
            skip: const Text('Skip'),
            next: const Icon(Icons.arrow_forward),
            done: const Text('Done',
                style: TextStyle(fontWeight: FontWeight.w600)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(10),
            controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(15.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
