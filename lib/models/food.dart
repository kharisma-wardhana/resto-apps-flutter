part of 'models.dart';

class Food {
  String name;

  Food({
    required this.name,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json["name"],
    );
  }
}
