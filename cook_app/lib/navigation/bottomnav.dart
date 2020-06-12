import 'package:cookapp/screens/constants.dart';
import 'package:cookapp/screens/favourites.dart';
import 'package:cookapp/screens/first_screen.dart';
import 'package:cookapp/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



/* this is the bottom navigation block of code and can be reused on any part by
 assigning the BottomNav() to the bottomNavigationBar within the scaffold
 */

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
      height: query.size.height * 0.13,
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
//              Colors.deepOrange;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),


          NavBarMenu(
            img: 'assets/images/chef.png',
            title: 'Methods',
            press: () {
//              Colors.deepOrange;
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstScreen()));
              },
          ),
        
          NavBarMenu(
            img: 'assets/images/heart.png',
            title: 'Favorites',
            press: () {
//              Colors.deepOrange;
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
              scale: 1.3,
              //BY UNCOMMENTING IT, ActiveStateColor CAN BE FOUND IN CONSTANTS.DART
              /*color: isActive ? ActiveStateColor : Color(0xff000000)*/),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
                color: isActive ? ActiveStateColor : Color(0xff000000)),
          ),
        ],
      ),
    );
  }
}
