import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_instant_eat/detail.dart';
import 'package:ui_instant_eat/model/category.dart';
import 'package:ui_instant_eat/model/popular.dart';
import 'package:ui_instant_eat/shared/color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listCategories = [
    Category(
      'assets/images/grape.png',
      'Fruits',
    ),
    Category(
      'assets/images/pizza.png',
      'Pizza',
    ),
    Category(
      'assets/images/burger.png',
      'Burger',
    )
  ];
  var indexSelected = -1;
  final listPopularFood = [
    PopularFood('Buffalo Burgers', 300, 2.5, 4.8, 'assets/images/hambogo.png'),
    PopularFood(
        'Sicilian Pizza', 750, 3.0, 5.0, 'assets/images/pizzaseafood.png'),
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 77,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  isDrawerOpen
                      ? Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                            child: Image.asset('assets/images/menu.png'),
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.background, elevation: 0),
                          ),
                        )
                      : Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                xOffset = 230;
                                yOffset = 100;
                                scaleFactor = 0.8;
                                isDrawerOpen = true;
                              });
                            },
                            child: Image.asset('assets/images/menu.png'),
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.background, elevation: 0),
                          ),
                        ),
                  Container(
                    child: Text(
                      'Instant Eats',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColor.title,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 95,
                  ),
                  Image.asset('assets/images/cart.png'),
                  Image.asset('assets/images/avatar.png')
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'What you would like \n to order?',
                style: TextStyle(
                    color: AppColor.commonText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                elevation: 5,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Container(
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: Image.asset('assets/images/adjust.png')),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        color: AppColor.commonText,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: AppColor.title.withOpacity(0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              height: 178,
              child: ListView.builder(
                  itemCount: listCategories.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ItemCategories(
                      label: listCategories[index].name,
                      imgUrl: listCategories[index].image,
                      isSelected: this.indexSelected == index,
                      onPressed: () async {
                        setState(() {
                          this.indexSelected = index;
                        });
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(tit: listCategories[index].name),
                            ));
                        if (result != null) {
                          if (result is bool) {
                            print("result from Details: $result");
                          } else if (result is Category) {}
                        }
                      },
                    );
                  }),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Popular",
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.commonText,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: listPopularFood.length,
                  itemBuilder: (context, index) {
                    return PopularFoods(
                      weight: listPopularFood[index].weight,
                      imgUrl: listPopularFood[index].img,
                      title: listPopularFood[index].name,
                      price: listPopularFood[index].price,
                      rating: listPopularFood[index].rate,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ItemCategories extends StatefulWidget {
  final String label;
  final String imgUrl;
  bool isSelected = false;
  VoidCallback onPressed;
  ItemCategories(
      {@required this.label,
      @required this.imgUrl,
      this.isSelected,
      this.onPressed});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<ItemCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 110,
      height: 178,
      decoration: BoxDecoration(
        color: widget.isSelected ? AppColor.primary : AppColor.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 25.0,
            spreadRadius: 6.0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(widget.imgUrl),
            Text(
              widget.label,
              style: TextStyle(fontSize: 14, color: AppColor.commonText),
            ),
            RawMaterialButton(
              onPressed: widget.onPressed,
              elevation: 0,
              fillColor:
                  widget.isSelected ? AppColor.background : AppColor.backButton,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: widget.isSelected ? Colors.black : Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              shape: CircleBorder(),
            )
          ],
        ),
      ),
    );
  }
}

class PopularFoods extends StatefulWidget {
  final String imgUrl;
  final String title;
  final double weight;
  final double price;
  final double rating;
  PopularFoods(
      {@required this.imgUrl,
      @required this.rating,
      @required this.price,
      @required this.title,
      @required this.weight});

  @override
  _PopularFoodsState createState() => _PopularFoodsState();
}

class _PopularFoodsState extends State<PopularFoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 171,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        boxShadow: [
          //background color of box
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 6.0,
            //extend the shadow
          ),
        ],
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/crown.png'),
                        Text(
                          'Top of the week',
                          style: TextStyle(
                              color: AppColor.commonText, fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: AppColor.commonText,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Weight ${widget.weight}'),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          '\$ ${widget.price}',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 90, height: 50),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: AppColor.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)))),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Image.asset('assets/images/star.png'),
                  Text('${widget.rating}'),
                ],
              ),
            ],
          ),
          Expanded(child: Image.asset(widget.imgUrl)),
        ],
      ),
    );
  }
}
