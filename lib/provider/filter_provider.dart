
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/meals_provider.dart';

enum Filters {

glutenFree ,
luctoseFree,
vegan,
vegetarian

}



class FilterNotifier extends StateNotifier<Map<Filters ,bool>>{
FilterNotifier() : super({

Filters.glutenFree : false ,
             
     Filters.luctoseFree : false,

       Filters.vegan : false ,

       Filters.vegetarian : false


}) ;
void setFilters(Map<Filters ,bool> chooseFilters){
  state = chooseFilters ;
}
 
 void setFilter(Filters filter , bool isActive){
   // state[filter] = isActive ; // is not allowwed as they are mutating the same value instead of making a new one 

   state = {
    ...state ,    // copy the existing map key value pair then , take explicitly filter : isActive one by one 
    filter : isActive  , // this will overwrite the existing map key value 
   };
 }

}


final filtersProvider = StateNotifierProvider< FilterNotifier , Map<Filters,bool>>((ref)=> FilterNotifier());

final filteredMealProvider  = Provider((ref){
  final meals = ref.watch(mealProvider) ;   
  final activeFilter = ref.watch(filtersProvider) ;

  return meals.where((meal){
  if(activeFilter[Filters.glutenFree]! && !meal.isGlutenFree){
    return false ;
  }
 if(activeFilter[Filters.luctoseFree]! && !meal.isLactoseFree){
    return false ;
  }

   if(activeFilter[Filters.vegan]! && !meal.isVegan){
    return false ;
  }
   if(activeFilter[Filters.vegetarian]! && !meal.isVegetarian ){
    return false ;
  }
  return true ;
} ).toList();
});