import 'package:flutter/material.dart';

class MelaItemsTrait extends StatelessWidget{
  const MelaItemsTrait({super.key, required this.icon , required this.label}) ;

final IconData icon ;
final String label ;

@override
  Widget build(BuildContext context) {
    
   return Row(
    children: [
      Icon(
        icon,
        size: 16,
        color: Colors.white
      ),
      SizedBox(height: 10),
      Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold

        ),
      )
    ],
   );
  }








}