import 'package:flutter/material.dart';
import 'package:meal_app/model/meals.dart';
import 'package:meal_app/widgets/meal_itemstrait.dart';
import 'package:transparent_image/transparent_image.dart';

class Mealdrawer extends StatelessWidget {
  const Mealdrawer({
    super.key,
    required this.meal,
  });
  final Meal meal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordibilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Meal Avaliable",
        style: TextStyle(
            color: const Color.fromARGB(255, 255, 247, 0),
            fontWeight: FontWeight.bold),
      )),
      body: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 3,

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
                        MealItemsTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        SizedBox(
                          width: 27,
                        ),
                        MealItemsTrait(
                            icon: Icons.work, label: (complexityText)),
                        SizedBox(width: 27),
                        MealItemsTrait(
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
