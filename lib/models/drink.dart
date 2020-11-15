part of 'models.dart';

class Drink {
  String name;

  Drink({this.name});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(
      name: json["name"],
    );
  }
}
