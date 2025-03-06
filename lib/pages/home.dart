import 'package:fitness_app/models/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double RADIUS = 12.0;

  List<Category> categories = [];

  @override
  void initState() {
    _getCategories();
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
        ],
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

    // NOTE: я не хочу использовать ListView.seperated
    var padding = const EdgeInsets.symmetric(horizontal: 8.0);
    if (index == 0) {
      padding = const EdgeInsets.only(left: 24.0, right: 8.0);
    }
    if (index == categories.length - 1) {
      padding = const EdgeInsets.only(left: 8.0, right: 24.0);
    }

    return Padding(
      padding: padding,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(RADIUS),
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
          suffixIcon: Container(
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
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RADIUS),
            borderSide: BorderSide.none,
          ),
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
        child: Container(
          margin: EdgeInsets.all(12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(RADIUS),
          ),
          child: SvgPicture.asset(
            'assets/icons/arrow-left.svg',
            height: 24,
            width: 24,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(RADIUS),
            ),
            child: SvgPicture.asset(
              'assets/icons/three-dots.svg',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _getHeaderTextStyle(FontWeight fontWeight) {
    return TextStyle(color: Colors.black, fontSize: 24, fontWeight: fontWeight);
  }

  void _getCategories() {
    categories = Category.getCategories();
  }
}
