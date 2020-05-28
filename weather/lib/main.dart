import 'package:flutter/material.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/pages/location.dart';
import 'package:weather/pages/splash_screen.dart';
import 'package:weather/pages/about.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  routes: {
    '/': (context) => SplashScreen(),
    '/home': (context) => Home(),
    '/about': (context) => About(),
  }
));

