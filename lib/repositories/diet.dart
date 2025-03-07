import 'package:fitness_app/entities/diet.dart';
import 'package:flutter/material.dart';

class DietRepository {
  static final List<DietEntity> _recommendedDiets = [
    DietEntity(
      name: 'Медовые блиночки',
      image: 'assets/images/diets/honey-pancake.jpg',
      level: 'Easy',
      durationInMinutes: 30,
      calories: 180,
      backgroundColor: Colors.yellow.shade100,
    ),
    DietEntity(
      name: 'Канайский хлеб',
      image: 'assets/images/diets/canai-bread.jpg',
      level: 'Easy',
      durationInMinutes: 20,
      calories: 230,
      backgroundColor: Colors.amber.shade100,
    ),
  ];

  static final List<DietEntity> _popularDiets = [
    DietEntity(
      name: 'Черничные блиночки',
      image: 'assets/images/diets/blueberry-pancake.jpg',
      level: 'Medium',
      durationInMinutes: 30,
      calories: 230,
    ),
    DietEntity(
      name: 'Лосось Нигири',
      image: 'assets/images/diets/salmon-nigiri.jpg',
      level: 'Easy',
      durationInMinutes: 20,
      calories: 120,
    ),
  ];

  static List<DietEntity> fetchRecommendedDiets() {
    // TODO: implement this with API
    return _recommendedDiets;
  }

  static List<DietEntity> fetchPopularDiets() {
    // TODO: implement this with API
    return _popularDiets;
  }
}
