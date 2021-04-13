import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_instant_eat/shared/color.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
            ),
          ],
        ),
      ),
    );
  }
}
