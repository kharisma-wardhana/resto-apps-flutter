part of 'models.dart';

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menu menus;

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.city,
      this.pictureId,
      this.rating,
      this.menus});

  Restaurant.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    description = data['description'];
    city = data['city'];
    pictureId = data['pictureId'];
    rating = data['rating'] as double;
    menus = data['menus'] != null ? Menu.fromJson(data['menus']) : null;
  }
}

List<Restaurant> parseRestaurants(String json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json)['restaurants'];
  print("Checked parsed data ==> $parsed");

  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
