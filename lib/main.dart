import 'package:flutter/material.dart';
import 'package:ui_instant_eat/detail.dart';
import 'package:ui_instant_eat/drawer.dart';
import 'package:ui_instant_eat/home/home.dart';
import 'package:ui_instant_eat/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          HomePage(),
        ],
      ),
    );
  }
}
