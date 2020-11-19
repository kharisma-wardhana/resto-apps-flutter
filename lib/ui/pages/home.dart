part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
      children: [
        Container(
          color: lightColor,
        ),
        SafeArea(
          child: Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: secondColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'assets/icons/burger_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Foodies",
                  style: infoStyle.copyWith(
                    color: mainColorDark,
                    fontSize: 30,
                    letterSpacing: 2,
                    decoration: TextDecoration.none,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(SearchPage());
                      },
                      child: Icon(
                        EvaIcons.searchOutline,
                        color: secondColorDark,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              height: SizeConfig.screenHeight * 0.8,
              child: _listRestaurant(context),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.centerLeft,
            child: _sideBarMenu(context),
          ),
        ),
      ],
    );
  }
}

Widget _listRestaurant(BuildContext context) {
  return Consumer<RestaurantProvider>(
    builder: (context, restaurantProvider, _) {
      if (restaurantProvider.state == ResultState.Loading) {
        return CustomLoading();
      }
      if (restaurantProvider.state == ResultState.Error) {
        return Padding(
          padding: const EdgeInsets.only(
            left: defaultMargin + 35,
          ),
          child: Center(
            child: Text(
              restaurantProvider.message,
              style: infoStyle.copyWith(
                fontSize: 20,
              ),
            ),
          ),
        );
      }
      return restaurantProvider.state == ResultState.HasData
          ? ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: restaurantProvider.listRestaurant
                      .map((resto) => Padding(
                            padding: EdgeInsets.only(
                                left: (resto ==
                                        restaurantProvider.listRestaurant.first)
                                    ? defaultMargin + 38
                                    : 0,
                                right: 10),
                            child: GestureDetector(
                              onTap: () {
                                context
                                    .read<RestaurantProvider>()
                                    .fetchRestaurant(resto.id)
                                    .then((value) {
                                  if (value is Restaurant) {
                                    Get.to(
                                      DetailsPage(
                                        restaurant: resto,
                                        onBackPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    );
                                  }
                                });
                              },
                              child: _restaurantItem(context, resto),
                            ),
                          ))
                      .toList(),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Center(
                child: Text(restaurantProvider.message),
              ),
            );
    },
  );
}

Widget _restaurantItem(BuildContext context, Restaurant restaurant) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
          colors: [secondColorDark, secondColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft),
    ),
    child: Column(
      children: [
        Hero(
          tag: restaurant.id,
          child: Container(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FutureBuilder(
                future:
                    RestaurantServices.getRestaurantImage(restaurant.pictureId),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      color: lightColor,
                      child: CustomLoading(),
                    );
                  }
                  if (snapshot.data == null) {
                    return Image.asset(
                      'assets/images/fast_foods.png',
                      fit: BoxFit.cover,
                    );
                  }
                  return Image.network(snapshot.data);
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          restaurant.city,
          style: infoLightStyle.copyWith(
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          restaurant.name,
          style: infoLightStyle.copyWith(
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              restaurant.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 8,
              style: infoLightStyle.copyWith(
                fontSize: 18,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _sideBarMenu(BuildContext context) {
  return Container(
    width: 60,
    height: SizeConfig.screenHeight * 0.6,
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  EvaIcons.compass,
                  color: secondColorDark,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Popular",
                  style: infoStyle.copyWith(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(
                  EvaIcons.heart,
                  color: secondColorDark,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Favorite",
                  style: infoStyle.copyWith(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: GestureDetector(
            onTap: () {
              Get.to(
                AboutPage(),
                transition: Transition.zoom,
              );
            },
            child: Row(
              children: [
                Icon(
                  EvaIcons.questionMarkCircle,
                  color: secondColorDark,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "About",
                  style: infoStyle.copyWith(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
