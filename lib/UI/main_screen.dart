import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/authentication/authentication_bloc.dart';
import 'package:unicorn_store/Business_Logic/bloc/login%20and%20signup/login/login_bloc.dart';
import 'package:unicorn_store/Data/Models/Login%20and%20Signup/Login/login_data.dart';
import 'package:unicorn_store/Data/Repositories/cart/add_to_local_cart_repository.dart';
import 'package:unicorn_store/UI/Components/default_snackbar.dart';
import 'package:unicorn_store/UI/HomePage/Components/build_app_bar.dart';
import 'package:unicorn_store/UI/HomePage/home_page.dart';
import 'package:unicorn_store/UI/HomePage/NavigationDrawer/Contact/contact_page.dart';
import 'package:unicorn_store/UI/HomePage/NavigationDrawer/Hot%20Deals/hot_deals_page.dart';
import 'package:unicorn_store/UI/LoginPage/Components/custom_submit_button.dart';
import 'package:unicorn_store/UI/LoginPage/sign_up_form.dart';
import 'package:unicorn_store/UI/My%20Account/my_account_page.dart';
import 'package:unicorn_store/UI/ProductCategories/main_category.dart';
import 'package:unicorn_store/my_app.dart';
import 'HomePage/NavigationDrawer/Components/navigation_bar_list_item.dart';
import 'HomePage/NavigationDrawer/Student Offer/student_offer_screen.dart';
import 'LoginPage/login_form.dart';
import 'size_config.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  static String id = "Main_Screen";

  int selectedIndex = 0;

  MainScreen({Key? key, required this.selectedIndex})
      : super(
          key: key,
        );

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late AuthenticationBloc authenticationBloc;
  late LoginBloc loginBloc;

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  LoginData? loginData;

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    loginBloc = LoginBloc(
        RepositoryProvider.of<AddToLocalCartRepository>(context),
        BlocProvider.of<AuthenticationBloc>(context));
    FlutterNativeSplash.remove();

    super.initState();
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    Container(),
    const MainCategory(),
    BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          return const MyAccountPage();
        } else {
          //Alert Dialog for login warning
          return AlertDialog(
            title: Center(
              child: Text(
                'Login',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
            content: const Text(
              'You can not access my account without login.',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.5),
            ),
            actions: <Widget>[
              Center(
                child: LoginButton(
                    title: "Login",
                    color: Theme.of(context).colorScheme.secondary,
                    onPress: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return BlocProvider.value(
                          value: BlocProvider.of<AuthenticationBloc>(context),
                          child: const LoginScreen(
                            myAccountRedirect: "true",
                          ),
                        );
                      }), (Route<dynamic> route) => true);
                    }),
              )
            ],
          );
        }
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: () async {
        if (widget.selectedIndex == 0) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return false;
        } else if (widget.selectedIndex == 1 || widget.selectedIndex == 2) {
          setState(() {
            widget.selectedIndex = 0;
          });
          return false;
        }
        return false;
      },
      child: BlocProvider(
        create: (context) => loginBloc,
        child: Scaffold(
          appBar: const BuildAppBar(),
          drawer: navigationDrawer(context),
          //Bottom Navigation Bar
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.selectedIndex,
            iconSize: getProportionateScreenWidth(25),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore_rounded,
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_rounded,
                ),
                label: 'Products',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_rounded,
                ),
                label: 'Account',
              ),
            ],
            onTap: (index) {
              setState(() {
                widget.selectedIndex = index;
              });
            },
          ),

          body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                loginData = state.loginData;
              }
              return BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          defaultSnackBar(
                              state.error,
                              Theme.of(context).colorScheme.error,
                              Theme.of(context).colorScheme.onError,
                              2000));
                    }
                    if (state is LoginInitial) {
                      loginOutAnalyticsEvent();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MyApp();
                      }));
                    }
                  },
                  child: SafeArea(
                      child: _widgetOptions.elementAt(widget.selectedIndex)));
            },
          ),
        ),
      ),
    );
  }

  //Navigation Drawer
  Drawer navigationDrawer(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return UserAccountsDrawerHeader(
                  accountName: Text(
                    "${state.loginData.userData!.firstname!} ${state.loginData.userData!.lastname!}",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  accountEmail: Text(
                    state.loginData.userData!.email!,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.onPrimary,
                    child: Text(
                      state.loginData.userData!.firstname!.substring(0, 1),
                      style: TextStyle(
                          fontSize: 40.0,
                          color:
                              Theme.of(context).platform == TargetPlatform.iOS
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : null),
                    ),
                  ),
                );
              }
              return UserAccountsDrawerHeader(
                accountName: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BlocProvider.value(
                            value: authenticationBloc,
                            child: const LoginScreen(
                              myAccountRedirect: "false",
                            ),
                          );
                        }));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.circle,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 5,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BlocProvider.value(
                            value: authenticationBloc,
                            child: const SignUpForm(),
                          );
                        }));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                accountEmail: Text(
                  "",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.onPrimary,
                  child: const Text(
                    "L",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              );
            },
          ),

          //Login
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return NavigationDrawerListItem(
                  title: "My Account",
                  onPress: () {
                    //Here we are using anonymous route for main Screen because
                    //we need to pass index value through constructor
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return BlocProvider.value(
                        value: authenticationBloc,
                        child: MainScreen(selectedIndex: 2),
                      );
                    }), (Route<dynamic> route) => true);
                  },
                );
              }
              return Container();
            },
          ),

          //Home
          NavigationDrawerListItem(
              title: "Home",
              onPress: () {
                Navigator.of(context).pop();
                //Navigator.pushNamed(context, StudentOfferScreen.id);
              }),

          //Student Offer
          NavigationDrawerListItem(
              title: "Student Offer",
              onPress: () {
                Navigator.pushNamed(context, StudentOfferScreen.id);
              }),

          //Training
          NavigationDrawerListItem(
              title: "Training",
              onPress: () {
                //Navigator.pushNamed(context, ListOfChildren.id);
              }),

          //Support
          NavigationDrawerListItem(
              title: "Support",
              onPress: () {
                //Navigator.pushNamed(context, ListOfProduct.id);
              }),

          //Personal Shopper
          NavigationDrawerListItem(title: "Personal Shopper", onPress: () {}),

          //Contact
          NavigationDrawerListItem(
              title: "Contact",
              onPress: () {
                Navigator.pushNamed(context, ContactPage.id);
              }),

          //Hot Deals
          NavigationDrawerListItem(
              title: "Hot Deals",
              onPress: () {
                Navigator.pushNamed(context, HotDealsPage.id);
              }),

          //Logout
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return NavigationDrawerListItem(
                  title: "Logout",
                  onPress: () {
                    loginBloc.add(
                        LoggedOut(state.loginData.userData!.token.toString()));
                  },
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

//Firebase analytics event
  Future<void> loginOutAnalyticsEvent() async {
    await analytics.logEvent(name: "logout_event", parameters: {
      "user_name":
          "${loginData!.userData!.firstname} ${loginData!.userData!.lastname}",
      "email": loginData!.userData!.email,
    }).then((value) => print("Analytics login out Event added successfully"));
  }
}
