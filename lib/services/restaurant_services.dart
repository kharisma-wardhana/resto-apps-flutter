part of 'services.dart';

class RestaurantServices {
  static Future<ApiResponse<List<Restaurant>>> getListRestaurant(
      {http.Client client}) async {
    client ??= http.Client();

    var response = await client.get(endpointListResto);
    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    List<Restaurant> restaurants = (data['restaurants'] as Iterable)
        .map((e) => Restaurant.fromJson(e))
        .toList();
    return ApiResponse(data: restaurants);
  }

  static Future<ApiResponse<Restaurant>> getRestaurant(String id,
      {http.Client client}) async {
    client ??= http.Client();

    String url = '$endpointDetailResto/$id';
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    Restaurant restaurant = Restaurant.fromJson(data['restaurant']);
    return ApiResponse(data: restaurant);
  }

  static Future<ApiResponse<List<Restaurant>>> searchRestaurant(String query,
      {http.Client client}) async {
    client ??= http.Client();

    String url = '$endpointSearchResto?q=$query';
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    List<Restaurant> restaurants = (data['restaurants'] as Iterable)
        .map((e) => Restaurant.fromJson(e))
        .toList();

    return ApiResponse(data: restaurants);
  }

  static Future<String> getRestaurantImage(String pictureId,
      {http.Client client}) async {
    client ??= http.Client();

    String url = '$baseImageURL/$pictureId';
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return "Please try again";
    }
    return url;
  }
}
