part of 'provider.dart';

class RestaurantProvider extends ChangeNotifier {
  String _message;
  ResultState _state;
  ResultState _detailState;
  ResultState _searchState;
  List<Restaurant> _listRestaurant;
  List<Restaurant> _listSearchRestaurant;
  Restaurant _restaurant;

  ResultState get state => _state;
  ResultState get detailState => _detailState;
  ResultState get searchState => _searchState;
  String get message => _message;
  List<Restaurant> get listRestaurant => _listRestaurant;
  List<Restaurant> get listSearchRestaurant => _listSearchRestaurant;
  Restaurant get restaurant => _restaurant;

  RestaurantProvider() {
    _fetchAllRestaurant();
  }

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final apiResponse = await RestaurantServices.getListRestaurant();
      if (apiResponse.data == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Empty Data";
      }
      _state = ResultState.HasData;
      notifyListeners();
      return _listRestaurant = apiResponse.data;
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      print(e);
      return _message = "Error ==== $e";
    }
  }

  Future<dynamic> fetchRestaurant(String restaurantId) async {
    try {
      _detailState = ResultState.Loading;
      notifyListeners();
      final apiResponse = await RestaurantServices.getRestaurant(restaurantId);
      if (apiResponse.data == null) {
        _detailState = ResultState.NoData;
        notifyListeners();
        return _message = "Empty Data";
      }
      _detailState = ResultState.HasData;
      notifyListeners();
      print('CCCCCCCCCCCC ======= $apiResponse');
      return _restaurant = apiResponse.data;
    } catch (e) {
      _detailState = ResultState.Error;
      notifyListeners();
      return _message = "Error ==== $e";
    }
  }

  Future<dynamic> searchRestaurant(String searchQuery) async {
    try {
      _searchState = ResultState.Loading;
      notifyListeners();
      final apiResponse =
          await RestaurantServices.searchRestaurant(searchQuery);
      if (apiResponse.data == null) {
        _searchState = ResultState.NoData;
        notifyListeners();
        return _message = "Empty Data";
      }
      _searchState = ResultState.HasData;
      notifyListeners();
      return _listSearchRestaurant = apiResponse.data;
    } catch (e) {
      _searchState = ResultState.Error;
      notifyListeners();
      return _message = "Error ==== $e";
    }
  }

  Future<dynamic> addReview() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
