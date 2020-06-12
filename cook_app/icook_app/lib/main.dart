import 'package:flutter/material.dart';
import 'package:icookapp/HomePage.dart';
import 'package:icookapp/LaunchPage.dart';


void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: LaunchPage(),
    )
);
