import 'package:flutter/material.dart';
import 'package:meal_app/model/meals.dart';
import 'package:meal_app/screens/cooking_process.dart';
import 'package:meal_app/widgets/meal_items.dart';
// import 'package:meal_app/widgets/meal_items.dart';

class Mealscreen extends StatelessWidget {
  const Mealscreen({super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => CookingScreen(food: meal)));
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isNotEmpty
          ? ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) => Mealitems(
                    meal: meals[index],
                    onSelectMeal: selectMeal,
                  ))
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Cuisine Not Avaliable"),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Try Different Cuisine",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground))
                ],
              ),
            ),
    );
  }
}
