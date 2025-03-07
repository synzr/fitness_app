import 'dart:convert';

import 'package:fitness_app/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  static Future<List<CategoryEntity>> fetchCategories(String apiBaseUrl) async {
    final uri = Uri.parse("$apiBaseUrl/categories");
    final response = await http.get(uri);
    
    if (response.statusCode == 200) {
      List<dynamic> raw = json.decode(response.body);
      List<CategoryEntity> entities = [];

      for (var category in raw) {
        entities.add(
          CategoryEntity(
            title: category['title'],
            image: "$apiBaseUrl${category['image_uri']}",
            backgroundColor: Color(category['background_color'])
          )
        );
      }

      return entities;
    }

    throw Exception('failed to fetch all categories');
  }
}
