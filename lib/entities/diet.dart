import 'package:flutter/material.dart';

class DietEntity {
  String name;
  String image;
  String level;
  int durationInMinutes;
  int calories;
  Color backgroundColor;

  DietEntity({
    required this.name,
    required this.image,
    required this.level,
    required this.durationInMinutes,
    required this.calories,
    this.backgroundColor = Colors.transparent,
  });
}
