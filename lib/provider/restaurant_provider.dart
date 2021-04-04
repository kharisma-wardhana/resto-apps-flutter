part of 'provider.dart';

class RestaurantProvider extends ChangeNotifier {
  late String _message;
  late ResultState _state;
  late ResultState _detailState;
  late ResultState _searchState;
  late ResultState _reviewState;
  late List<Restaurant>? _listRestaurant;
  late List<Restaurant>? _listSearchRestaurant;
  late List<CustomerReview>? _listcustomerReview;
  late Restaurant? _restaurant;

  ResultState get state => _state;
  ResultState get detailState => _detailState;
  ResultState get searchState => _searchState;
  ResultState get reviewState => _reviewState;
  String get message => _message;
  List<Restaurant>? get listRestaurant => _listRestaurant;
  List<Restaurant>? get listSearchRestaurant => _listSearchRestaurant;
  List<CustomerReview>? get listCustomerReview => _listcustomerReview;
  Restaurant? get restaurant => _restaurant;

  RestaurantProvider() {
    _fetchAllRestaurant();
  }

  Future<void> refreshAllRestaurant() async {
    return _fetchAllRestaurant();
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
      return _message = "Silahkan check connection Anda";
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
      _listcustomerReview = apiResponse.data?.customerReviews;
      return _restaurant = apiResponse.data;
    } catch (e) {
      _detailState = ResultState.Error;
      notifyListeners();
      return _message = "Silahkan check connection Anda";
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
        return _message =
            "Empty Data, Silahkan masukkan nama\nrestaurant atau menu lainnya";
      }
      _searchState = ResultState.HasData;
      notifyListeners();
      return _listSearchRestaurant = apiResponse.data;
    } catch (e) {
      _searchState = ResultState.Error;
      notifyListeners();
      return _message = "Silahkan check connection Anda";
    }
  }

  Future<dynamic> addReview(
      String restaurantId, String name, String review) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final apiResponse =
          await RestaurantServices.postReview(restaurantId, name, review);
      if (apiResponse.data == null) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = "Empty Data";
      }
      _state = ResultState.HasData;
      notifyListeners();
      print(apiResponse.data);
      return _listcustomerReview = apiResponse.data;
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = "Silahkan check connection Anda";
    }
  }
}
