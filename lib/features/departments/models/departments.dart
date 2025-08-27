import 'package:flutter/material.dart';

class Department {
  final int id;
  final String title;
  // final String description;
  // final List<String> navigation;
  // final List<String> instructions;
  final String image;
  final String bgImageName;
  final Color bgColor;

  const Department({
    required this.id,
    required this.title,
    //required this.description,
    //required this.navigation,
    //required this.instructions,
    required this.image,
    required this.bgImageName,
    required this.bgColor,
  });

  String get bgImage =>
      bgImageName.isEmpty ? '' : 'assets/images/departments_icons/$bgImageName.png';

  String get bgImageLg =>
      bgImageName.isEmpty ? '' : 'assets/images/departments_icons/$bgImageName-lg.png';
}
