import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
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
          suffixIcon: _createSuffixIcon(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  SizedBox _createSuffixIcon() {
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
}
