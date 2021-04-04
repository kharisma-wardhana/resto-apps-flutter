part of 'models.dart';

class Menu {
  List<Food> foods;
  List<Drink> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    var listOfFoods = List<Map<String, dynamic>>.from(json["foods"]).toList();

    List<Food> foods = [];
    foods = listOfFoods.map((food) => Food.fromJson(food)).toList();

    var listOfDrinks = List<Map<String, dynamic>>.from(json["drinks"]).toList();

    List<Drink> drinks = [];
    drinks = listOfDrinks.map((drink) => Drink.fromJson(drink)).toList();

    return Menu(
      foods: foods,
      drinks: drinks,
    );
  }
}
