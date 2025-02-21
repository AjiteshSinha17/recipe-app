import 'package:flutter/material.dart';
import 'package:meal_app/model/meals.dart';
import 'package:meal_app/screens/cooking_process.dart';
import 'package:meal_app/widgets/meal_items.dart';
// import 'package:meal_app/widgets/meal_items.dart';

class Mealscreen extends StatelessWidget {
  const Mealscreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => CookingScreen(
              food: meal,
            )));
  }

  @override
  Widget build(context) {
    return title != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(title!),
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
                        Text("Cuisine Not Avaliable",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 30,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Try Different Cuisine",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 30,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary))
                      ],
                    ),
                  ),
          )
        : Scaffold(
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
                        Text("Cuisine Not Avaliable!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 28,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary)),
                        SizedBox(
                          height: 16,
                        ),
                        Text("Try Different Cuisine",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 18,
                                    color:
                                        Theme.of(context).colorScheme.primary))
                      ],
                    ),
                  ),
          );
  }
}
