import 'package:restaurant_app/domain/entity/restaurant_entity.dart';

abstract class RestaurantRepository {
  Future<List<RestaurantEntity>> getListRestaurant();
}
