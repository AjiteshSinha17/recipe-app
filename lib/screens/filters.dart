import 'package:flutter/material.dart';
// import 'package:meal_app/model/meals.dart';
// import 'package:meal_app/screens/meal.dart';
// import 'package:meal_app/screens/mealDrawer.dart';
// import 'package:meal_app/screens/tabs.dart';
// import 'package:meal_app/widgets/drawer.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class FilterScreen extends ConsumerWidget{
  const FilterScreen({super.key }) ;
 

@override
Widget build(BuildContext context, WidgetRef ref){
 final activeFilters =  ref.watch(filtersProvider);
return Scaffold(
  appBar: AppBar(
    title: Text("Yours Filters"),   
  ),


  // drawer : DrawerScreen(OnScreenTap: (identifier){
  //   Navigator.of(context).pop();
  //   if(identifier == "Meals"){
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => TabScreen()));
  //    }
  //   }) ,

  body:
Column(
      children: [
       
   SwitchListTile(
          value: activeFilters[Filters.glutenFree]!,
         onChanged: (ischecked){
            ref.read(filtersProvider.notifier).setFilter(Filters.glutenFree, ischecked) ;
         } ,
         secondary: Icon(Icons.health_and_safety_rounded) ,
         title: Text("Gluten-Free" , 
         style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)), 
         subtitle: Text("Only Include gluten-free meals" ,
         style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
         activeColor:  const Color.fromARGB(255, 94, 0, 209) ,
         contentPadding: EdgeInsets.only(left: 32,right: 24,
          )),
    
          
 SwitchListTile(
          value: activeFilters[Filters.luctoseFree]!,
         onChanged: (ischecked){
           ref.read(filtersProvider.notifier).setFilter(Filters.luctoseFree, ischecked);
         } ,
        secondary: Icon(Icons.health_and_safety_outlined) ,
    
         title: Text("Luctose-Free" , 
         style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)), 
         subtitle: Text("Only Include Luctose-free meals" ,
         style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
         activeColor:  const Color.fromARGB(255, 94, 0, 209) ,
         contentPadding: EdgeInsets.only(left: 32,right: 24,
          )),
    
  SwitchListTile(
          value: activeFilters[Filters.vegan]!,
         onChanged: (ischecked){
          ref.read(filtersProvider.notifier).setFilter(Filters.vegan, ischecked);
         } ,
        
        secondary: Icon(Icons.fastfood),
    
         title: Text("Vegan" , 
         style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)), 
         subtitle: Text("Only Include Vegan meals" ,
         style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
         activeColor:  const Color.fromARGB(255, 94, 0, 209) ,
         contentPadding: EdgeInsets.only(left: 32,right: 24,
          )) ,
    
    
 SwitchListTile(
          value: activeFilters[Filters.vegetarian]!,
         onChanged: (ischecked){
         ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, ischecked);
         } ,
                secondary: Icon(Icons.food_bank_sharp) ,
    
         title: Text("Vegetarian" , 
         style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground)), 
         subtitle: Text("Only Include Vegetarian meals" ,
         style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground)),
         activeColor:  const Color.fromARGB(255, 94, 0, 209) ,
         contentPadding: EdgeInsets.only(left: 32,right: 24,
          )) 
          
         ],
         ),
  );
}

}