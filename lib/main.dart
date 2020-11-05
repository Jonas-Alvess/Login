import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list2/pages/AdminPage.dart';
import 'package:list2/pages/MemberPage.dart';
import 'package:list2/pages/splashScreen.dart';
import 'package:list2/register.dart';
import 'Home.dart';
import 'login_page.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Login Localhost',
      home: new SplashScreen(),

    );
  }

  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      hintColor: Colors.white,
      primaryColor: Colors.yellow[500],
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.blue,
        ),
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}