part of 'models.dart';

class CustomerReview {
  String name;
  String review;

  CustomerReview({this.name, this.review});

  factory CustomerReview.fromJson(Map<String, dynamic> json) {
    return CustomerReview(
      name: json["name"],
      review: json['review'],
    );
  }
}
