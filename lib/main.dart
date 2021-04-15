import 'package:flutter/material.dart';
import 'package:ui_instant_eat/drawer.dart';
import 'package:ui_instant_eat/home.dart';
import 'package:ui_instant_eat/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Stack(
          children: [
            DrawerScreen(),
            HomePage(),
          ],
        ));
  }
}
