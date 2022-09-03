import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app_challenge/presentations/screens/home_screen.dart';
import 'package:music_app_challenge/presentations/screens/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(
            descriptionPage:
                "Splash screen image can be as first main logic for auth app",
          ),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            descriptionPage: "Main Homepage",
          ),
        );
      default:
        return null;
    }
  }
}
