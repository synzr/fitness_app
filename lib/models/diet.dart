import 'package:flutter/material.dart';

class Diet {
  String name;
  String image;
  String level;
  int durationInMinutes;
  int calories;
  Color backgroundColor;

  Diet({
    required this.name,
    required this.image,
    required this.level,
    required this.durationInMinutes,
    required this.calories,
    this.backgroundColor = Colors.transparent,
  });

  static List<Diet> getRecommendedDiets() {
    return [
      Diet(
        name: 'Медовые блиночки',
        image: 'assets/images/diets/honey-pancake.jpg',
        level: 'Easy',
        durationInMinutes: 30,
        calories: 180,
        backgroundColor: Colors.yellow.shade100,
      ),
      Diet(
        name: 'Канайский хлеб',
        image: 'assets/images/diets/canai-bread.jpg',
        level: 'Easy',
        durationInMinutes: 20,
        calories: 230,
        backgroundColor: Colors.amber.shade100,
      )
    ];
  }

  static List<Diet> getPopularDiets() {
    return [
      Diet(
        name: 'Черничные блиночки',
        image: 'assets/images/diets/blueberry-pancake.jpg',
        level: 'Medium',
        durationInMinutes: 30,
        calories: 230,
      ),
      Diet(
        name: 'Лосось Нигири',
        image: 'assets/images/diets/salmon-nigiri.jpg',
        level: 'Easy',
        durationInMinutes: 20,
        calories: 120,
      )
    ];
  }
}
