import 'package:flutter/material.dart';
// import 'package:meal_app/data/dummy_data.dart';
// import 'package:meal_app/model/meals.dart';
import 'package:meal_app/screens/catgories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meal.dart';
//import 'package:meal_app/screens/mealdrawer.dart';
import 'package:meal_app/widgets/drawer.dart';
import 'package:meal_app/provider/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/provider/fav_provider.dart';
import 'package:meal_app/provider/filter_provider.dart';


const kinitialFilter = 
  {
   Filters.glutenFree : false ,
             
     Filters.luctoseFree : false,

       Filters.vegan : false ,

       Filters.vegetarian : false
} ;



class TabScreen extends ConsumerStatefulWidget {
  // final List<Meal> availableMeals;

  // Add this to pass meals from the parent widget
 
  const TabScreen({super.key,});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabState();
  }
}

class _TabState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;


// final List<Meal> _fav = [];

  // void _toggleStatus(Meal meal) {
  //   _fav.contains(meal)
  //       ? setState(() {
  //           _fav.remove(meal);
  //           _favInfo("CUISINE IS NO LONGER YOUR FAV ");
  //         })
  //       : setState(() {
  //           _fav.add(meal);
  //           _favInfo("CUISINE IS NOW YOUR FAV ");
  //         });
  // }



  @override
  Widget build(BuildContext context) {
  
final availableMeal = ref.watch(filteredMealProvider) ;

    Widget activePage = CategoryScreen(

      availableMeal: availableMeal,
    );
  
     var activePageTitle = "CHOOSE YOUR CUISINE";

    if (_selectedPageIndex == 1) {
      final favmeal = ref.watch(FavMeal) ;
      activePage = Mealscreen(
        meals: favmeal,
        
      );
      activePageTitle = "YOUR FAVOURITE";
    }

 void setScreen(String identifier)async {
  Navigator.of(context).pop();
if(identifier == "Filters"){
   await Navigator.of(context).push<Map<Filters , bool>>(
         MaterialPageRoute(
          builder: (ctx) => const  FilterScreen(
            
          ),
          ),
        );
}

  }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
 


    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: DrawerScreen(
        OnScreenTap: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
