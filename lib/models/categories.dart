part of 'models.dart';

class Categories {
  String name;

  Categories({this.name});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      name: json["name"],
    );
  }
}
