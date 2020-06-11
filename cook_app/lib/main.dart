import 'package:cookapp/screens/details_screen.dart';
import 'package:cookapp/screens/first_screen.dart';
import 'package:cookapp/screens/home_screen.dart';
import 'package:cookapp/screens/second_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';


void main() => runApp(MaterialApp(
  home: CustomSplash(
    imagePath: 'assets/images/logo.png',
    backGroundColor: Color(0xffffffff),
    animationEffect: 'zoom-out',
    logoSize: 200,
    home: CookApp(),
    duration: 5000,
    type: CustomSplashType.StaticDuration,
  ),
  theme: ThemeData(
    fontFamily: 'Nunito'
  ),

  debugShowCheckedModeBanner: false,
));

class CookApp extends StatefulWidget {
  @override
  _CookAppState createState() => _CookAppState();
}

class _CookAppState extends State<CookApp> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FirstScreen()
    );
  }
}
