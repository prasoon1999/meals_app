import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeal.title}',
          style: Theme.of(context).appBarTheme.textTheme!.headline6,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...selectedMeal.ingredients.map(
                (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Text(index),
                  );
                },
              ),
            ],
          ),
          buildSectionTitle(context, 'Preparation'),
          Column(
            children: [
              ...selectedMeal.steps.map((index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    tileColor: Colors.amber[100],
                    visualDensity: VisualDensity.standard,
                    title: Text(
                      index,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                );
              }),
            ],
          ),
          SizedBox(height: 160),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => toggleFavorite(mealId),
        splashColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
      ),
    );
  }
}
