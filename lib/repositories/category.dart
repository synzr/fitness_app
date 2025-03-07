import 'package:fitness_app/entities/category.dart';
import 'package:flutter/material.dart';

class CategoryRepository {
  static final List<CategoryEntity> _categories = [
    CategoryEntity(
      title: "Салаты",
      image: "assets/images/categories/salad.jpg",
      backgroundColor: Colors.teal.shade100,
    ),
    CategoryEntity(
      title: "Торты",
      image: "assets/images/categories/cake.jpg",
      backgroundColor: Colors.pink.shade100,
    ),
    CategoryEntity(
      title: "Пироги",
      image: "assets/images/categories/pie.jpg",
      backgroundColor: Colors.brown.shade100,
    ),
    CategoryEntity(
      title: "Смузи",
      image: "assets/images/categories/smoothie.jpg",
      backgroundColor: Colors.red.shade100,
    ),
  ];

  static List<CategoryEntity> fetchCategories() {
    // TODO: implement this with API
    return _categories;
  }
}
