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
    return Scaffold(
      bottomNavigationBar: BottomNav(),
    );
  }

  Widget _mainBody() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider(); 

        final index = i ~/ 2;

        return _buildRow();
      });
}

  Widget _buildRow() {
  return ListTile();
}
}
