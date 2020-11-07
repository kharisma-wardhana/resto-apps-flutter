part of 'models.dart';

class Food {
  String name;

  Food({this.name});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(name: json["name"]);
  }
}
