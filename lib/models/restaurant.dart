part of 'models.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menu menus;
  final List<Categories> categories;
  final List<CustomerReview> customerReviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    var listOfCategories = json['categories'] != null
        ? List<Map<String, dynamic>>.from(json["categories"]).toList()
        : [];
    var listOfReview = json['customerReviews'] != null
        ? List<Map<String, dynamic>>.from(json["customerReviews"]).toList()
        : [];
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      pictureId: json['pictureId'],
      rating: json['rating'].toDouble(),
      menus: Menu.fromJson(json['menus']),
      categories: listOfCategories.map((e) => Categories.fromJson(e)).toList(),
      customerReviews:
          listOfReview.map((e) => CustomerReview.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      };
}
