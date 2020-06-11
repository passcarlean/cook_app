import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text(
              'Are you sure?',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            content: new Text(
              'Do you want to exit iCook App',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: BottomNav(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              ClipPath(
                clipper: MainClipper(),
                child: Container(
                  padding: EdgeInsets.only(bottom: 100.0, right: 40.0),
                  width: query.size.width,
                  height: query.size.height * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/food.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('iCook',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white
                                    )),
                                    Text('Cooking Never Been This Exciting',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                child: Text('Tasty Buds',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.orange)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    OvalImages(
                      query: query,
                      png: 'assets/images/Egusi.jpg',
                    ),
                    OvalImages(
                      query: query,
                      png: 'assets/images/Egusi.jpg',
                    ),
                    OvalImages(
                      query: query,
                      png: 'assets/images/Egusi.jpg',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
                child: Text('Most Popular Soups',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.orange)),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: query.size.height * 0.43,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                          SizedBox(width: 10),
                          FoodCard(
                            query: query,
                            title: 'Melon Soup',
                            img: 'assets/images/Egusi.jpg',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
    @required this.query,
    this.png,
  }) : super(key: key);

  final MediaQueryData query;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: query.size.height * 0.160,
        width: query.size.width * 0.27,
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
    @required this.query,
    this.title,
    this.subtitle,
    this.img,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(
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
        size.width / 2, size.height, size.width, size.height - 70);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
