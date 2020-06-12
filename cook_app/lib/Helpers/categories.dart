
import 'package:flutter/material.dart';

import 'package:cookapp/api/model.dart';
import 'package:cookapp/recipes/recipe_image.dart';
import 'package:cookapp/recipes/recipe_title.dart';
import 'Favstore.dart';
import '../api/model.dart';



class Categories  extends StatefulWidget {
//  Categories({Key key}) : super(key: key);
  final MainData recipe;
  final bool inFavorites;

  Categories(this.recipe, this.inFavorites);

  @override
  _CategoriesState createState() =>  _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  bool _inFavorites;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
    _inFavorites = widget.inFavorites;
  }

  @override
  void dispose() {
    // "Unmount" the controllers:
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleInFavorites() {
    setState(() {
      _inFavorites = !_inFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RecipeImage(widget.recipe.imageLink,),
                    RecipeTitle(widget.recipe, 25.0),
                  ],
                ),
              ),
              expandedHeight: 340.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: "Description"),
                  Tab(text: "Ingredients "),



                ],
                controller: _tabController,
              ),
            )
          ];
        },

        body: TabBarView(
          children: <Widget>[
          ],
          controller: _tabController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         getFavourites();
          _toggleInFavorites() ;
//          then((result) {
//            // Toggle "in favorites" if the result was successful.
//            if (result) _toggleInFavorites();
//          });
        },
        child: Icon(
          _inFavorites ? Icons.favorite : Icons.favorite_border,
          color: Theme.of(context).iconTheme.color,
        ),
        elevation: 2.0,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  final List<String> description;

  DescriptionView(this.description);

  @override
  Widget build(BuildContext context) {
    List<Widget> textElements = List<Widget>();
    description.forEach((item) {
      textElements.add(
        Text(item),
      );
      // Add spacing between the lines:
      textElements.add(
        SizedBox(
          height: 10.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: textElements,
    );
  }
}

class IngredientsView extends StatelessWidget {
  final List<String> ingredients;

  IngredientsView(this.ingredients);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    ingredients.forEach((item) {
      children.add(
        new Row(
          children: <Widget>[
            new Icon(Icons.done),
            new SizedBox(width: 5.0),
            new Text(item),
          ],
        ),
      );
      // Add spacing between the lines:
      children.add(
        new SizedBox(
          height: 5.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: children,
    );
  }
}

