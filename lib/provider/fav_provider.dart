import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meals.dart';

class FavMealNotifier extends StateNotifier<List<Meal>>{
FavMealNotifier() : super([]);

bool toggleFavMeal(Meal food){ // food is argument taken by Me

final isFav = state.contains(food) ;



// Removing and Adding of List of meals to the New List 
 if( isFav){
state = state.where((meal) => meal.id!= food.id).toList()  ;
return false;
 }
else { state = [... state , food]; }
return true ;
} 

}

final FavMeal =  StateNotifierProvider<FavMealNotifier , List<Meal>>((ref){
    return FavMealNotifier () ;
}) ;

