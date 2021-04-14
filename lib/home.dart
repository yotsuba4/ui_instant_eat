import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_instant_eat/model/popular.dart';
import 'package:ui_instant_eat/shared/color.dart';

class HomePage extends StatelessWidget {
  final images = [
    'assets/images/grape.png',
    'assets/images/pizza.png',
    'assets/images/burger.png',
  ];

  final categoryNames = [
    'Fruits',
    'Pizza',
    'Burger',
  ];

  final listPopularFood = [
    PopularFood('Buffalo Burgers', 300, 2.5, 4.8, 'assets/images/hambogo.png'),
    PopularFood(
        'Sicilian Pizza', 750, 3.0, 5.0, 'assets/images/pizzaseafood.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Instants Eats',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.title, fontSize: 20),
        ),
        backgroundColor: AppColor.background,
        leading: ElevatedButton(
          onPressed: () {},
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
                    itemCount: images.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Categories(
                        label: categoryNames[index],
                        imgUrl: images[index],
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
    );
  }
}

class Categories extends StatelessWidget {
  final String label;
  final String imgUrl;
  Categories({@required this.label, @required this.imgUrl});

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
            Image.asset(imgUrl),
            Text(
              label,
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

class PopularFoods extends StatelessWidget {
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
                title,
                style: TextStyle(
                    color: AppColor.commonText,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Weight $weight'),
                  Text(
                    '\$ $price',
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
                  Text('$rating'),
                ],
              ),
            ],
          ),
          Image.asset(imgUrl),
        ],
      ),
    );
  }
}
