import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
// import 'package:meal_app/model/meals.dart';
import 'package:meal_app/screens/meal.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/widgets/category_griditems.dart';

class CatgororyScreen extends StatelessWidget {
  const CatgororyScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filterMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //Navigator.push(context, route)
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            Mealscreen(title: category.title, meals: filterMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHOOSE YOUR CUISINE"),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20), // controls the layout of the  grid

          children: [
            // avaliableCategories.map((category))=> CategoryGridItems(category: category).tolist()
            for (final category in availableCategories)
              CategoryGridItems(
                category: category,
                onSelecting: () {
                  _selectCategory(context, category);
                },
              )
          ]),
    );
  }
}
