part of 'provider.dart';

class FavoriteProvider extends ChangeNotifier {
  late final DatabaseHelper? databaseHelper;

  late ResultState _state;
  ResultState get state => _state;

  late String _message;
  String get message => _message;

  List<Restaurant>? _favorites = [];
  List<Restaurant>? get favorites => _favorites;

  FavoriteProvider({required this.databaseHelper}) {
    _getFavorites();
  }

  void _getFavorites() async {
    _favorites = await databaseHelper?.getFavorite();
    if (_favorites!.length > 0) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(Restaurant resto) async {
    try {
      await databaseHelper?.insertFavorite(resto);
      _getFavorites();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    final favRestaurant = await databaseHelper?.getFavoriteById(id);
    return favRestaurant!.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper?.removeFavorite(id);
      _getFavorites();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
