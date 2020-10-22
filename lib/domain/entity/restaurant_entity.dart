import 'package:equatable/equatable.dart';

class RestaurantListEntity extends Equatable {
  final bool error;
  final String message;
  final List<RestaurantEntity> restaurants;

  RestaurantListEntity({this.restaurants, this.message, this.error});

  @override
  List<Object> get props => [restaurants, message, error];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String rating;

  RestaurantEntity(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.city,
      this.rating});

  @override
  List<Object> get props => [
        id,
        name,
        description,
        pictureId,
        city,
        rating,
      ];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['rating'] = this.rating;
    return data;
  }
}
