import 'package:fitness_app/models/category.dart';
import 'package:fitness_app/models/diet.dart';
import 'package:fitness_app/widgets/home/category_section.dart';
import 'package:fitness_app/widgets/home/recommended_diet_section.dart';
import 'package:fitness_app/widgets/home/search_bar.dart';
import 'package:fitness_app/widgets/home/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categories = [];

  List<Diet> recommendedDiets = [];

  List<Diet> popularDiets = [];

  @override
  void initState() {
    super.initState();

    _getCategories();
    _getRecommendedDiets();
    _getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSearchBar(),
          HomeSectionTitle(title: 'Категории'),
          HomeCategorySection(categories: categories),
          HomeSectionTitle(title: 'Рекомендуемые диеты'),
          HomeRecommendedDietSection(recommendedDiets: recommendedDiets),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: Text(
        'Завтрак',
        style: TextStyle(
          fontFamily: 'Overpass',
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: _getAppBarIcon('assets/icons/arrow-left.svg'),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: _getAppBarIcon('assets/icons/three-dots.svg'),
        ),
      ],
    );
  }

  Container _getAppBarIcon(String asset) {
    return Container(
      margin: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SvgPicture.asset(asset, height: 24, width: 24),
    );
  }

  void _getCategories() {
    categories = Category.getCategories();
  }

  void _getRecommendedDiets() {
    recommendedDiets = Diet.getRecommendedDiets();
  }

  void _getPopularDiets() {
    popularDiets = Diet.getPopularDiets();
  }
}
