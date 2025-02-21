import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget{
 DrawerScreen({super.key , required this.OnScreenTap}) ;


 void Function(String identifier) OnScreenTap ;

@override
  Widget build(BuildContext context) {
   return Drawer(
  child: Column(
    children: [
      DrawerHeader(decoration:BoxDecoration(
        gradient: LinearGradient(colors: [Theme.of(context).colorScheme.primaryContainer ,
        Theme.of(context).colorScheme.primaryContainer.withOpacity(.8)] ,
        begin: Alignment.topLeft,
        end: Alignment.topRight ,
        )
      ) ,
      padding: EdgeInsets.all(16) ,
      child: Row(
        children: [
          Icon(Icons.fastfood_rounded , size:  48 , color:  const Color.fromARGB(255, 247, 137, 2),) ,
          SizedBox(width:  18,),
          Text("COOKING UP!" , style: Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color.fromARGB(255, 0, 255, 179)),)

        ],
      ) ,
       ) , 
       
       ListTile(
        leading: Icon(
          Icons.restaurant_menu_rounded , 
          color: Colors.cyanAccent,
          size: 24,
        ),
        title: Text(
          "Meals" ,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color.fromARGB(255, 255, 255, 255)  ),),
        onTap: (){
         OnScreenTap("Meals") ;
        },
        
       ),

       ListTile(
        leading: Icon(
          Icons.filter_alt , 
          color: Colors.cyanAccent,
          size: 24,
        ),
        title: Text(
          "Filters" ,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: const Color.fromARGB(255, 255, 255, 255)  ),),
        onTap: (){
         OnScreenTap("Filters") ;
        },
        
       ),

    ],
    
  ),
  
   );
  }
}