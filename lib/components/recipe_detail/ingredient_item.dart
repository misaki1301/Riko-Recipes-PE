import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final String name;

  const IngredientItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle_rounded,
          size: 12,
          color: Colors.amberAccent,
        ),
        const SizedBox(width: 8,),
        Text(name)
      ],
    );
  }
}
