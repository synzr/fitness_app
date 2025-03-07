import 'package:fitness_app/models/diet.dart';
import 'package:fitness_app/utils.dart';
import 'package:flutter/material.dart';

class HomeRecommendedDietSection extends StatelessWidget {
  const HomeRecommendedDietSection({super.key, required this.recommendedDiets});

  final List<Diet> recommendedDiets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 256,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendedDiets.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget? _itemBuilder(context, index) {
    final diet = recommendedDiets[index];
    return Padding(
      // NOTE: я не хочу использовать ListView.seperated
      padding: getItemPadding(index, recommendedDiets.length),
      child: Container(
        width: 210,
        decoration: BoxDecoration(
          color: diet.backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 115,
              height: 115,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(diet.image),
              ),
            ),
            _getDetails(diet),
            _getButton(),
          ],
        ),
      ),
    );
  }

  Padding _getButton() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
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
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _getDetails(Diet diet) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 175,
        child: Column(
          children: [
            Text(
              diet.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
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
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    '·',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    '${diet.durationInMinutes} минут',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
