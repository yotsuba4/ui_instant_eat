import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_instant_eat/shared/color.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Instants Eats',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.title, fontSize: 20),
        ),
        backgroundColor: Colors.white,
        leading: Image.asset('assets/images/menu.png'),
        actions: <Widget>[
          Image.asset('assets/images/cart.png'),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Image.asset('assets/images/avatar.png')),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'What you would like \n to order?',
                    style: TextStyle(
                        color: AppColor.commonText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: AppColor.primary),
                  icon: Icon(Icons.search),
                  suffixIcon: Container(
                      color: AppColor.primary,
                      child: Image.asset('assets/images/adjust.png')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
