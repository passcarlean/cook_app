import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cookapp/navigation/bottomnav.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cookapp/api/model.dart';
import 'package:cookapp/Helpers/Details.dart';
import 'package:cookapp/Helpers/Favstore.dart';


class DetailsScreen extends StatefulWidget {
  final MainData data;

  DetailsScreen(this.data);





  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

   List<String> favourites = getFavourites();



  void _handleFavouritesList(String recipe) {
    setState(() {
      if(favourites.contains(recipe)){
        favourites.remove(recipe);
        print('Removed from favourites');
      } else {
        favourites.add(recipe);
        print('Added to favourites');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            onPressed: () {
              _handleFavouritesList(widget.data.name);
            },
          )
        ],
        elevation: 5,
        title: Text(
          widget.data.name,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffe67e22).withOpacity(.8),
      ),
      resizeToAvoidBottomPadding: true,
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: <Widget>[
          Container(
            height: query.size.height * 0.35,
            width: query.size.width,
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.data.imageLink,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 1.0),
          Container(
            height: query.size.height * 0.34,
            decoration: BoxDecoration(),
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: Column(
                    children: <Widget>[
                      Details(
                        title: 'Description',
                        description: widget.data.description,
                      ),
                      SizedBox(height: 4.0),
                      Details(
                        title: 'Ingredients',
                        description: widget.data.ingredients,
                      ),
                      SizedBox(height: 4.0),
                      Details(
                        title: 'Cooking Method',
                        description: widget.data.steps,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1,
          )
        ],
      ),
    );
  }
}