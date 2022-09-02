// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:music_app_challenge/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  String descriptionPage;
  SplashScreen({super.key, required this.descriptionPage});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  redirectToMainPage() async {
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.of(context).pushNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    redirectToMainPage();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  colorBlack,
                  colorBlackSecondary,
                ],
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Image.asset(
                "assets/images/logo-musicme.png",
                width: size.width * 0.6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
