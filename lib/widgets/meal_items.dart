import 'package:flutter/material.dart';
import 'package:meal_app/model/meals.dart';
import 'package:meal_app/widgets/meal_itemstrait.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealitems extends StatelessWidget {
  const Mealitems({super.key, required this.meal , required this.onSelectMeal});

  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordibilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  } 

  final void Function (BuildContext context, Meal meal)  onSelectMeal ;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap:() {
           onSelectMeal(context , meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(163, 0, 0, 0),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 43),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ), // Very long text...
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MelaItemsTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        SizedBox(
                          width: 27,
                        ),
                        MelaItemsTrait(
                            icon: Icons.work, label: (complexityText)),
                        SizedBox(width: 27),
                        MelaItemsTrait(
                            icon: Icons.attach_money,
                            label: (affordibilityText)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ), // it is not like column it like put each other
        //  image ke upar eekk text ko rkhna
      ),
    );
  }
}
