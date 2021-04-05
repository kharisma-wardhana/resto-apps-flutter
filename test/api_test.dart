import 'package:flutter_test/flutter_test.dart';
import 'package:foodies/services/services.dart';

void main() {
  test('Fetch data all restaurants', () async {
    final listRestaurants = await RestaurantServices.getListRestaurant();
    var restaurant = listRestaurants.data;
    expect(restaurant?.length, 20);
  });

  test('Fetch data nama restaurant pertama', () async {
    final listRestaurants = await RestaurantServices.getListRestaurant();
    var restaurant = listRestaurants.data?[0];
    expect(restaurant?.name, "Melting Pot");
  });

  test('Check url image restaurant', () async {
    final imageURL = await RestaurantServices.getRestaurantImage('14');
    expect(imageURL, "https://restaurant-api.dicoding.dev/images/small/14");
  });
}
