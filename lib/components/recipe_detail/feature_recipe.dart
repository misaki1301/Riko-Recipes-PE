import 'package:flutter/material.dart';

class FeatureRecipe extends StatelessWidget {
  final String amount;
  final String type;
  const FeatureRecipe({Key? key, required this.amount, required this.type}) : super(key: key);

  Widget getIconByType() {
    Widget icon;
    switch (type) {
      case "time":
        icon = const Icon(
              Icons.timer,
              color: Colors.black,
            );
        break;
      case "person":
        icon = const Icon(
          Icons.person,
          color: Colors.black,
        );
        break;
      case "calories":
        icon = const Icon(
          Icons.local_fire_department,
          color: Colors.black,
        );
        break;
      case "level":
        icon = const Icon(
          Icons.stacked_bar_chart,
          color: Colors.black,
        );
        break;
      default :
        icon = const Icon(
          Icons.ac_unit,
          color: Colors.black,
        );
        break;
    }

    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.white,
      child: icon,
    );
  }

  String getLabelByType() {
    switch(type) {
      case "time":
        return "mins";
      case "person":
        return "persons";
      case "calories":
        return "Cals";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(
          top: 8, bottom: 8),
      width: 72,
      height: 108,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(32),
          color: Colors.amberAccent),
      child: Column(
        children: [
          ClipOval(
              child: getIconByType()),
          const SizedBox(
            height: 4,
          ),
          Text(
            amount,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
          Text(getLabelByType(), style: const TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
