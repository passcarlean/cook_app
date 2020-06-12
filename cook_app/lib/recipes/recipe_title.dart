import 'package:flutter/material.dart';

import 'package:cookapp/api/model.dart';


class RecipeTitle extends StatelessWidget {
  final MainData recipe;
  final double padding;

  RecipeTitle(this.recipe, this.padding);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        // Default value for crossAxisAlignment is CrossAxisAlignment.center.
        // We want to align title and description of recipes left:
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            recipe.name,
            style: Theme.of(context).textTheme.title,
          ),
          // Empty space:
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.timer, size: 20.0),
              SizedBox(width: 5.0),
              Text(
                recipe.name,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
