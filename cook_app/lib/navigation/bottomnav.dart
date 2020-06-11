import 'package:cookapp/screens/constants.dart';
import 'package:cookapp/screens/favourites.dart';
import 'package:cookapp/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/* this is the bottom navigation block of code and can be reused on any part by
 assigning the BottomNav() to the bottomNavigationBar within the scaffold
 */

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      height: query.size.height * 0.14,
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(.05),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarMenu(
            img: 'assets/images/chefhat.png',
            title: 'Home',
            //isActive: true,
            press: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          NavBarMenu(
            img: 'assets/images/chef.png',
            title: 'Methods',
            press: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
          ),
        
          NavBarMenu(
            img: 'assets/images/heart.png',
            title: 'Favorites',
            press: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Favourites()));
            },
          ),
        ],
      ),
    );
  }
}

class NavBarMenu extends StatelessWidget {
  final String img;
  final String title;
  final bool isActive;
  final Function press;
  const NavBarMenu({
    Key key,
    this.img,
    this.title,
    this.isActive = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(img,
              //BY UNCOMMENTING IT, ActiveStateColor CAN BE FOUND IN CONSTANTS.DART
              /*color: isActive ? ActiveStateColor : Color(0xff000000)*/),
          Text(
            title,
            style: TextStyle(
                color: isActive ? ActiveStateColor : Color(0xff000000)),
          ),
        ],
      ),
    );
  }
}
