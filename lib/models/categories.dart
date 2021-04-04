part of 'models.dart';

class Categories {
  String name;

  Categories({
    required this.name,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      name: json["name"],
    );
  }
}
