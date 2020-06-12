import 'package:cookapp/screens/favourites.dart';
import 'package:cookapp/screens/first_screen.dart';
import 'package:cookapp/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';


void main() => runApp(MaterialApp(
  home: CustomSplash(
    imagePath: 'assets/images/logo.png',
    backGroundColor: Color(0xffffffff),
    animationEffect: 'zoom-in',
    logoSize: 200,
    home: CookApp(),
    duration: 4000,
    type: CustomSplashType.StaticDuration,
  ),
  routes: <String, WidgetBuilder> {
    '/screen1' : (BuildContext context) => new HomeScreen(),
    '/screen2' : (BuildContext context) => new FirstScreen(),
    '/screen3' : (BuildContext context) => new Favourites(),
  },
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
      body: HomeScreen()
    );
  }
}
