import 'package:flutter/material.dart';

import 'package:meal_app/model/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class CookingScreen extends StatelessWidget {
  const CookingScreen({super.key, required this.food});

  final Meal food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(food.imageUrl),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(
            height: 16,
          ),
          Text("INGREDIENTS",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    // Thickness of the underline ),
                  )),
          SizedBox(
            height: 10,
          ),
          for (final ingredient in food.ingredients)
            Text(ingredient,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
          SizedBox(
            height: 15,
          ),
          
          Text("STEPS",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    // Thickness of the underline ),
                  )),
          SizedBox(
            height: 5,
          ),
          for (final steps in food.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic)),
            ),
        ]),
      ),
    );
  }
}
