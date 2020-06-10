import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return SafeArea(
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7],
            colors: [
              Colors.amber.withOpacity(.7),
              Colors.amber.withOpacity(.5),
              Colors.amber.withOpacity(.01),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNav(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white.withOpacity(.5),
                      border: Border.all(
                        color: Colors.amber.withOpacity(.35),
                        width: 0.1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('iCook',
                              style: TextStyle (
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              )
                          ),
                          Text('Cooking Never Been More Fun',
                              style: TextStyle (
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OvalImages(query: query,
                        png: 'assets/images/Egusi.jpg',),
                      OvalImages(query: query,
                        png: 'assets/images/Egusi.jpg',),
                      OvalImages(query: query,
                        png: 'assets/images/Egusi.jpg',),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OvalImages(query: query,
                        png: 'assets/images/Egusi.jpg',),
                      OvalImages(query: query,
                        png: 'assets/images/Egusi.jpg',),
                      OvalImages(query: query,
                        png: 'assets/images/Egusi.jpg',),
                    ],
                  ),

                  SizedBox(height: 30),
                  Text('Most Popular Soups',
                      style: TextStyle (
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      )
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: query.size.height * 0.43,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FoodCard(query: query,
                            title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                            SizedBox(width: 10),
                            FoodCard(query: query,
                              title: 'Melon Soup',
                              img: 'assets/images/Egusi.jpg',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OvalImages extends StatelessWidget {
  final String png;
  const OvalImages({
    Key key,
    @required this.query, this.png,
  }) : super(key: key);

  final MediaQueryData query;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: query.size.height * 0.19,
        width: query.size.width * 0.30,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          image: DecorationImage(
            image: AssetImage(png),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  const FoodCard({
    Key key,
    @required this.query, this.title, this.subtitle, this.img,
  }) : super(key: key);

  final MediaQueryData query;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 118.0, right: 40.0),
      width: query.size.width * 0.75,
      height: query.size.height * 0.35,
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(.4),
            blurRadius: 5, // soften the shadow
            //spreadRadius: .05, //extend the shadow
            offset: Offset(
              2.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        color: Color(0xFFF3B732),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text (title,
                        style: TextStyle (
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 78);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
