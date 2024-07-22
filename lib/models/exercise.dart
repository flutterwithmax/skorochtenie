import 'package:flutter/material.dart';

class Excercise {
  final String title;
  final String subtitle;
  final String imagePath;
  final String iconImgPath;
  Excercise(
      {required this.title,
      required this.subtitle,
      required this.imagePath,
      required this.iconImgPath});
}

enum Gamemode {
  mode_4x4,
  mode_5x5,
  mode_6x6,
  mode_7x7,
  mode_8x8,
}

class ColorContainer {
  final String title;
  final Color color;

  ColorContainer({
    required this.title,
    required this.color,
  });
}
