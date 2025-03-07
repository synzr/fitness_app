import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 24, bottom: 16),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Overpass',
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
