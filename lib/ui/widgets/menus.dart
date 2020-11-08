part of 'widgets.dart';

class Menus extends StatelessWidget {
  final List<Food> foods;
  final List<Drink> drinks;

  Menus(this.foods, this.drinks);

  @override
  Widget build(BuildContext context) {
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
                    children: foods.map((e) => menuItem(e)).toList(),
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
                    children: drinks.map((e) => menuItem(e)).toList(),
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

  Container menuItem(dynamic item) {
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
