import 'package:flutter/material.dart';
import 'package:iot_flutter/helper/auth_helper.dart';
import 'package:iot_flutter/screens/login/login_screen.dart';
import 'package:iot_flutter/screens/main_screen.dart';
import 'package:iot_flutter/screens/signup/signup_screen.dart';
import 'package:iot_flutter/screens/welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (BuildContext context) => FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (BuildContext context,
                  AsyncSnapshot<SharedPreferences> snapshot) {
                return checkLogin(snapshot);
              },
            ),
        "/login": (BuildContext context) => LoginScreen(),
        "/signup": (BuildContext context) => SignUpScreen(),
        "/" :   (BuildContext context) => WelcomeScreen(),
      },
      initialRoute: "/",
    );
  }

  Widget checkLogin(AsyncSnapshot<SharedPreferences> snapshot) {
    switch(snapshot.connectionState) {
      case ConnectionState.done:
        return snapshot.data.getString("token") != null ? HomeScreen() : LoginScreen();
      default:
        return Container();
    }
  }
}
