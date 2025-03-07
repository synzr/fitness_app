import 'package:flutter/material.dart';

EdgeInsets getItemPadding(int index, int length) {
  if (index == 0) {
    return const EdgeInsets.only(left: 24.0, right: 8.0);
  }

  if (index == length - 1) {
    return const EdgeInsets.only(left: 8.0, right: 24.0);
  }

  return const EdgeInsets.symmetric(horizontal: 8.0);
}
