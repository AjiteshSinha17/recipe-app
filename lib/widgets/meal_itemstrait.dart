import 'package:flutter/material.dart';

class MealItemsTrait extends StatelessWidget {
  const MealItemsTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
