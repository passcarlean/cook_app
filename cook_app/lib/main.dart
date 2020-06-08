import 'package:cookapp/screens/first_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  home: CookApp(),
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
