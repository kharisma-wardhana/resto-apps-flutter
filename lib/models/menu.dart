part of 'models.dart';

class Menu {
  List<Food> foods;
  List<Drink> drinks;

  Menu({this.foods, this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) {
    var listOfFoods = List<Map<String, dynamic>>.from(json["foods"]).toList();

    List<Food> foods = List<Food>();
    foods = listOfFoods.map((food) => Food.fromJson(food)).toList();

    var listOfDrinks = List<Map<String, dynamic>>.from(json["drinks"]).toList();

    List<Drink> drinks = List<Drink>();
    drinks = listOfDrinks.map((drink) => Drink.fromJson(drink)).toList();

    return Menu(
      foods: foods,
      drinks: drinks,
    );
  }
}
