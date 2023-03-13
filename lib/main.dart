import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:unicorn_store/app_config.dart';
import 'package:unicorn_store/my_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.setAppId("cdb82c0c-fcb5-49df-8fc8-2392c4dd9bb7");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    //print("Accepted permission: $accepted");
  });
  //This will initiate splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // initializing the firebase app
  await Firebase.initializeApp();

  //Initializing hive database
  await Hive.initFlutter();

  const configuredApp = AppConfig(
    environment: Environment.prod,
    url: 'testing in prod mode',
    child: MyApp(),
  );

  runApp(configuredApp);
}
