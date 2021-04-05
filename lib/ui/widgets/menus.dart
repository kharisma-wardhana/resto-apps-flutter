part of 'widgets.dart';

class Menus extends StatelessWidget {
  final Menu? menu;

  Menus(this.menu);

  @override
  Widget build(BuildContext context) {
    final List<Food> foods = menu!.foods;
    final List<Drink> drinks = menu!.drinks;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Foods",
              style: infoStyle,
            ),
          ),
          SizedBox(
            height: 8,
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
            child: Text(
              "Drinks",
              style: infoStyle,
            ),
          ),
          SizedBox(
            height: 8,
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

  Widget _menuItem(dynamic item) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 8,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: secondColor,
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
              Container(
                width: 120,
                child: Text(
                  item.name,
                  style: infoStyle.copyWith(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Positioned(
          top: 25,
          right: -22,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(180),
            child: Container(
              width: 50,
              height: 50,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
