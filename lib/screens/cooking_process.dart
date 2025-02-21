import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal_app/model/meals.dart';
import 'package:meal_app/provider/fav_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CookingScreen extends ConsumerWidget {
  const CookingScreen({
    super.key,
    required this.food,
  });

  final Meal food;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
 final  isFav = ref.watch(FavMeal);
  
 final isFavIcon = isFav.contains(food) ;

    return Scaffold(
      appBar: AppBar(
        title: Text(food.title),
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded = ref.read(FavMeal.notifier).toggleFavMeal(food);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      wasAdded
                          ? "CUISINE IS ADDED TO YOUR FAV"
                          : "CUISINE REMOVED FROM FAV",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: const Color.fromARGB(255, 172, 149, 82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(10),
                  ),
                );
              },
              
               // implicit Animation 
              icon: AnimatedSwitcher(
                duration:Duration(milliseconds: 200) ,
                transitionBuilder: (child, animation) {
                  return RotationTransition(turns: Tween<double>(
                    begin: 0.8 ,
                    end: 1 ).animate(animation) , child: child,) ; //child --> niiche vala child which tell ki trabsition kispr lagana hai
                },
                child: Icon( isFavIcon ? Icons.star  : Icons.star_border_outlined , key: ValueKey(isFavIcon),))) ,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: food.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(food.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
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
