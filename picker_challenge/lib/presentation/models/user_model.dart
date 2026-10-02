import 'package:flutter/material.dart';

class UserModel {
  final String name;
  int age;
  ImageProvider image;
  Color color;
  String fontFamily;

  UserModel({
    required this.name,
    required this.age,
    required this.image,
    required this.color,
    required this.fontFamily,
  });
}
