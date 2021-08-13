import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.no_food,
              size: 80,
              color: Colors.brown[900],
            ),
            SizedBox(height: 10),
            Text(
              'No favorites added yet',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
          duration: favoriteMeals[index].duration,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
