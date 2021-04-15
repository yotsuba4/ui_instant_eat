import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_instant_eat/model/category.dart';
import 'package:ui_instant_eat/model/popular.dart';
import 'package:ui_instant_eat/shared/color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final listCategories = [
    Category('assets/images/grape.png', 'Fruits'),
    Category('assets/images/pizza.png', 'Pizza'),
    Category('assets/images/burger.png', 'Burger')
  ];
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
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
      ),
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Instants Eats',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.title,
                fontSize: 20),
          ),
          backgroundColor: AppColor.background,
          leading: isDrawerOpen
              ? ElevatedButton(
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
                )
              : ElevatedButton(
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
          actions: <Widget>[
            Image.asset('assets/images/cart.png'),
            Container(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Image.asset('assets/images/avatar.png')),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
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
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Material(
                        elevation: 10,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: Container(
                                color: AppColor.primary,
                                child: Image.asset('assets/images/adjust.png')),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: AppColor.commonText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            color: AppColor.title,
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
                  height: 240,
                  child: ListView.builder(
                      itemCount: listCategories.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Categories(
                          label: listCategories[index].name,
                          imgUrl: listCategories[index].image,
                        );
                      }),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Popular",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.commonText,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                ListView.builder(
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
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  final String label;
  final String imgUrl;
  Categories({@required this.label, @required this.imgUrl});

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 110,
      height: 178,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(20),
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
            ElevatedButton(
              onPressed: () {},
              child: Image.asset('assets/images/next.png'),
              style: ElevatedButton.styleFrom(
                  primary: AppColor.primary, elevation: 0),
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
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/crown.png'),
                  Text(
                    'Top of the week',
                    style: TextStyle(color: AppColor.commonText, fontSize: 14),
                  )
                ],
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
                  Text(
                    '\$ ${widget.price}',
                  )
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                    style: ElevatedButton.styleFrom(primary: AppColor.primary),
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
          Image.asset(widget.imgUrl),
        ],
      ),
    );
  }
}
