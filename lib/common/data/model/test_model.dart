// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

List<TestModel> testModelFromJson(String str) => List<TestModel>.from(json.decode(str).map((x) => TestModel.fromJson(x)));

String testModelToJson(List<TestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModel {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  Category? category;

  TestModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    creationAt: json["creationAt"],
    updatedAt: json["updatedAt"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "creationAt": creationAt,
    "updatedAt": updatedAt,
    "category": category?.toJson(),
  };
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    creationAt: json["creationAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "creationAt": creationAt,
    "updatedAt": updatedAt,
  };
}
