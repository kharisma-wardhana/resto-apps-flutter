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
    this.id,
    this.name,
    this.description,
    this.city,
    this.pictureId,
    this.rating,
    this.categories,
    this.menus,
    this.customerReviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    var listOfCategories = json['categories'] != null
        ? List<Map<String, dynamic>>.from(json["categories"]).toList()
        : null;
    var listOfReview = json['customerReviews'] != null
        ? List<Map<String, dynamic>>.from(json["customerReviews"]).toList()
        : null;
    return Restaurant(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      pictureId: json['pictureId'],
      rating: json['rating'].toDouble(),
      menus: json['menus'] != null ? Menu.fromJson(json['menus']) : null,
      categories: json['categories'] != null
          ? listOfCategories.map((e) => Categories.fromJson(e)).toList()
          : null,
      customerReviews: json['customerReviews'] != null
          ? listOfReview.map((e) => CustomerReview.fromJson(e)).toList()
          : null,
    );
  }
}
