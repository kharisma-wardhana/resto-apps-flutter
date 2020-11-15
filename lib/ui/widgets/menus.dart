part of 'widgets.dart';

class Menus extends StatelessWidget {
  final Menu menu;

  Menus(this.menu);

  @override
  Widget build(BuildContext context) {
    final List<Food> foods = menu.foods;
    final List<Drink> drinks = menu.drinks;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
            child: Text("Foods"),
          ),
          Container(
            height: 100,
            child: foods.length != 0
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: foods.map((e) => _menuItem(e)).toList(),
                  )
                : Center(
                    child: Text(
                      "Don't have food",
                    ),
                  ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text("Drinks"),
          ),
          Container(
            height: 100,
            child: drinks.length != 0
                ? ListView(
                    scrollDirection: Axis.horizontal,
                    children: drinks.map((e) => _menuItem(e)).toList(),
                  )
                : Center(
                    child: Text(
                      "Don't have drink",
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Container _menuItem(dynamic item) {
    return Container(
      width: 280,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            child: Image.asset(
              'assets/images/fast_foods.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            item.name,
            style: infoStyle.copyWith(
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
