import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/model/meals.dart';
import 'package:meal_app/screens/meal.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/widgets/category_griditems.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key, required this.availableMeal});

  List<Meal> availableMeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
      
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

        _animationController.forward() ; // tell how to transit
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filterMeals = widget.availableMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    //Navigator.push(context, route)
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Mealscreen(
              title: category.title,
              meals: filterMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20), // controls the layout of the  grid

            children: [
              // avaliableCategories.map((category))=> CategoryGridItems(category: category).tolist()
              for (final category in availableCategories)
                CategoryGridItems(
                  category: category,
                  onSelecting: () {
                    _selectCategory(context, category);
                  },
                )
            ]),
        builder: (context, child) => SlideTransition(
            position: Tween(
              begin: const Offset(0, 0.3),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: child));
  }
}
