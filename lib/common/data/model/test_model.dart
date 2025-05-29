// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
  final String name;
  final String lastName;

  TestModel({
    required this.name,
    required this.lastName,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
    name: json["name"],
    lastName: json["last-name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "last-name": lastName,
  };
}
