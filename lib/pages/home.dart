import 'package:fitness_app/models/category.dart';
import 'package:fitness_app/models/diet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double borderRadius = 12.0;

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
      appBar: _createAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createSearchBar(),
          _createSectionTitle('Категории'),
          _createCategorySection(),
          _createSectionTitle('Рекомендуемые диеты'),
          _createRecommendationSection(),
        ],
      ),
    );
  }

  SizedBox _createRecommendationSection() {
    return SizedBox(
      height: 256,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendedDiets.length,
        itemBuilder: _recommendedDietItemGenerator,
      ),
    );
  }

  Widget? _recommendedDietItemGenerator(context, index) {
    final diet = recommendedDiets[index];
    return Padding(
      // NOTE: я не хочу использовать ListView.seperated
      padding: _getItemPadding(index, recommendedDiets.length),
      child: Container(
        width: 210,
        decoration: BoxDecoration(
          color: diet.backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 115,
              height: 115,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(diet.image),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: 175,
                child: Column(
                  children: [
                    Text(
                      diet.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${diet.calories} ккал',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          Text(
                            '·',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          Text(
                            '${diet.durationInMinutes} минут',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: GestureDetector(
                onTap: () => _recommendedDietOnTap(index),
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepOrange.shade300,
                        Colors.deepOrangeAccent.shade400,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Посмотреть',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _createCategorySection() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: _categoryItemBuilder,
      ),
    );
  }

  Widget? _categoryItemBuilder(context, index) {
    final category = categories[index];
    return Padding(
      // NOTE: я не хочу использовать ListView.seperated
      padding: _getItemPadding(index, categories.length),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Image.asset(category.image),
              ),
            ),
            Text(
              category.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Padding _createSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 24, bottom: 16),
      child: Column(
        children: [Text(title, style: _getHeaderTextStyle(FontWeight.w600))],
      ),
    );
  }

  Container _createSearchBar() {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 24),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(16),
          hintText: 'Поиск',
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          suffixIcon: _createSearchBarSuffixIcon(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  SizedBox _createSearchBarSuffixIcon() {
    return SizedBox(
      width: 100,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            VerticalDivider(
              color: Colors.black54,
              indent: 10,
              endIndent: 10,
              thickness: 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(
                'assets/icons/sliders.svg',
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text('Завтрак', style: _getHeaderTextStyle(FontWeight.bold)),
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {},
        child: _createAppBarIcon('assets/icons/arrow-left.svg'),
      ),
      actions: [
        GestureDetector(
          onTap: _settingsButtonOnTap,
          child: _createAppBarIcon('assets/icons/three-dots.svg'),
        ),
      ],
    );
  }

  Container _createAppBarIcon(String asset) {
    return Container(
      margin: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: SvgPicture.asset(asset, height: 24, width: 24),
    );
  }

  TextStyle _getHeaderTextStyle(FontWeight fontWeight) {
    return TextStyle(color: Colors.black, fontSize: 24, fontWeight: fontWeight);
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

  EdgeInsets _getItemPadding(int index, int length) {
    if (index == 0) {
      return const EdgeInsets.only(left: 24.0, right: 8.0);
    }

    if (index == length - 1) {
      return const EdgeInsets.only(left: 8.0, right: 24.0);
    }

    return const EdgeInsets.symmetric(horizontal: 8.0);
  }

  void _recommendedDietOnTap(int index) {
    // TODO: implement _recommendedDietOnTap
  }

  void _settingsButtonOnTap() {
    // TODO: implement _settingsButtonOnTap
  }
}
