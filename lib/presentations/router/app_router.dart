import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app_challenge/presentations/screens/home_screens.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
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
