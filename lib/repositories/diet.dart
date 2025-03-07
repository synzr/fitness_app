import 'dart:convert';

import 'package:fitness_app/entities/diet.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DietRepository {
  static List<DietEntity> _convertToDiets(String apiBaseUrl, List raw) {
    List<DietEntity> entities = [];

    for (var diet in raw) {
      entities.add(
        DietEntity(
          name: diet['name'],
          image: '$apiBaseUrl${diet['image_uri']}',
          level: diet['level'],
          durationInMinutes: diet['duration_in_minutes'],
          calories: diet['calories'],
          backgroundColor: Color(diet['background_color']),
        ),
      );
    }

    return entities;
  }

  static Future<List<DietEntity>> fetchRecommendedDiets(
    String apiBaseUrl,
  ) async {
    final uri = Uri.parse("$apiBaseUrl/diets/recommended");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> raw = json.decode(response.body);
      return _convertToDiets(apiBaseUrl, raw);
    }

    throw Exception('failed to fetch recommended diets');
  }

  static Future<List<DietEntity>> fetchPopularDiets(String apiBaseUrl) async {
    final uri = Uri.parse("$apiBaseUrl/diets/popular");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> raw = json.decode(response.body);
      return _convertToDiets(apiBaseUrl, raw);
    }

    throw Exception('failed to fetch recommended diets');
  }
}
