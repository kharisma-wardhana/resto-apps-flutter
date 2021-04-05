part of 'services.dart';

class RestaurantServices {
  static Future<ApiResponse<List<Restaurant>?>> getListRestaurant(
      {http.Client? client}) async {
    client ??= http.Client();

    Uri endpointListResto = Uri.https(baseURL, '/list');
    var response = await client.get(endpointListResto);
    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }
    var data = jsonDecode(response.body);
    var resto = data['restaurants'];

    List<Restaurant> restaurants =
        (resto as Iterable).map((e) => Restaurant.fromJson(e)).toList();

    return ApiResponse(
      message: 'Successfully',
      data: restaurants,
    );
  }

  static Future<ApiResponse<Restaurant>> getRestaurant(String id,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri endpointURL = Uri.https(baseURL, '/detail/$id');
    var response = await client.get(endpointURL);
    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    Restaurant restaurant = Restaurant.fromJson(data['restaurant']);
    return ApiResponse(
      message: 'Successfully',
      data: restaurant,
    );
  }

  static Future<ApiResponse<List<Restaurant>>> searchRestaurant(String query,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri endpointURL = Uri.https(baseURL, '/search', {"q": "$query"});
    var response = await client.get(endpointURL);
    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    List<Restaurant> restaurants = (data['restaurants'] as Iterable)
        .map((e) => Restaurant.fromJson(e))
        .toList();

    return ApiResponse(
      message: 'Successfully',
      data: restaurants,
    );
  }

  static Future<String> getRestaurantImage(String pictureId,
      {http.Client? client}) async {
    client ??= http.Client();

    Uri endpointURL = Uri.https(baseImageURL, '/$pictureId');
    var response = await client.get(endpointURL);
    if (response.statusCode != 200) {
      return "Please try again";
    }
    return endpointURL.toString();
  }

  static Future<ApiResponse<List<CustomerReview>>> postReview(
      String id, String name, String review,
      {http.Client? client}) async {
    client ??= http.Client();

    var bodyJson = jsonEncode(<String, dynamic>{
      'id': id,
      'name': name,
      'review': review,
    });

    Uri endpointURL = Uri.https(baseURL, '/review');
    var response = await client.post(
      endpointURL,
      headers: {
        "Content-Type": "application/json",
        "X-Auth-Token": tokenKey,
      },
      body: bodyJson,
    );

    if (response.statusCode != 200) {
      return ApiResponse(message: 'Please try again ${response.statusCode}');
    }

    var data = jsonDecode(response.body);
    List<CustomerReview> customerReviews = (data['customerReviews'] as Iterable)
        .map((e) => CustomerReview.fromJson(e))
        .toList();

    return ApiResponse(
      message: 'Successfully',
      data: customerReviews,
    );
  }
}
