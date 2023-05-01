import 'package:flutter/material.dart';

class ModelAboutProfile {
  String? image;
  TextEditingController displayName;
  TextEditingController gender;
  TextEditingController dob;
  TextEditingController horoscope;
  TextEditingController zodiac;
  TextEditingController height;
  TextEditingController weight;
  String? age;
  List<String>? listInterest;

  ModelAboutProfile({
    this.image,
    this.age,
    this.listInterest,
    required this.height,
    required this.displayName,
    required this.dob,
    required this.gender,
    required this.horoscope,
    required this.weight,
    required this.zodiac,
  });
}
