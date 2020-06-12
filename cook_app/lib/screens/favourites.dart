import 'package:cookapp/navigation/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:cookapp/api/model.dart';
import 'package:cookapp/Helpers/Favstore.dart';

class Favourites extends StatefulWidget {
  Favourites({Key key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}


class _FavouritesState extends State<Favourites> {
   List<String> favourites = getFavourites();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            SizedBox(height: 5.0),
          ],
          title: Padding(
            padding: const EdgeInsets.only(top: 9.0),
            child: Text(
              'Favourites',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
              ),
            ),
          ),
          elevation: 5,
          centerTitle: true,
          backgroundColor: Color(0xffe67e22).withOpacity(.8),
        ),
        bottomNavigationBar: BottomNav(),
    body: ListView.builder(
            itemCount: favourites.length,
              itemBuilder: (BuildContext context, int index) {
               return Container(
                 padding: EdgeInsets.all(15),
                  height: 50,
               child: Text('I love ${favourites[index]}'),
             );}
          ),
      )
    );

  }
}
