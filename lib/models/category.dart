import 'package:flutter/material.dart';

class Category {
  String title;
  String image;
  Color backgroundColor;

  Category({
    required this.title,
    required this.image,
    required this.backgroundColor,
  });

  static List<Category> getCategories() {
    return [
      Category(
        title: "Салаты",
        image: "assets/images/categories/salad.jpg",
        backgroundColor: Colors.teal.shade100,
      ),
      Category(
        title: "Торты",
        image: "assets/images/categories/cake.jpg",
        backgroundColor: Colors.pink.shade100,
      ),
      Category(
        title: "Пироги",
        image: "assets/images/categories/pie.jpg",
        backgroundColor: Colors.brown.shade100,
      ),
      Category(
        title: "Смузи",
        image: "assets/images/categories/smoothie.jpg",
        backgroundColor: Colors.red.shade100,
      )
    ];
  }
}
