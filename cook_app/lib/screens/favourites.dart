import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  Favourites({Key key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}


class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {

        return;
      },
      child: Scaffold(
        bottomNavigationBar: BottomNav(),
      ),
    );
  }


  Widget _buildRow() {
  return ListTile();
}
}
