import 'package:fitness_app/models/category.dart';
import 'package:fitness_app/utils.dart';
import 'package:flutter/material.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget? _itemBuilder(context, index) {
    final category = categories[index];
    return Padding(
      // NOTE: я не хочу использовать ListView.seperated
      padding: getItemPadding(index, categories.length),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 75,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
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
}
