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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: lightColor,
          ),
          Positioned(
            top: -SizeConfig.screenWidth * 0.3,
            left: -SizeConfig.screenWidth * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenWidth,
                color: secondColorDark,
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: Container(
                width: SizeConfig.screenWidth * 0.8,
                height: SizeConfig.screenWidth * 0.8,
                color: secondColorDark,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              height: 80,
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "Temukan\nRestaurants",
                      style: subtitleStyle.copyWith(
                        color: whiteColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
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
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(
                top: 65,
              ),
              height: SizeConfig.screenHeight * 0.85,
              child: _listRestaurant(context),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.centerLeft,
              child: _sideBarMenu(context),
            ),
          ),
        ],
      ),
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
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                Row(
                  children: restaurantProvider.listRestaurant!
                      .map((resto) => Padding(
                            padding: EdgeInsets.only(
                                left: (resto ==
                                        restaurantProvider
                                            .listRestaurant?.first)
                                    ? defaultMargin + 40
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
                                        initialPage: 0,
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
                left: defaultMargin + 40,
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
      borderRadius: BorderRadius.circular(10),
      color: whiteColor,
      boxShadow: [
        BoxShadow(
          color: lightColor,
        ),
      ],
    ),
    child: Stack(
      children: [
        Hero(
          tag: restaurant.id,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Container(
              height: 180,
              width: 250,
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/fast_foods.png",
                image: "$baseImageURL/${restaurant.pictureId}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 180,
          width: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0),
              ],
              begin: Alignment(0, 1),
              end: Alignment(0, 0.3),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 135),
          padding: EdgeInsets.fromLTRB(16, defaultMargin, 16, defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: infoLightStyle.copyWith(
                  fontSize: 18,
                  color: secondColorDark,
                ),
              ),
              CustomRating(restaurant.rating),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    restaurant.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: infoLightStyle.copyWith(
                      fontSize: 14,
                      color: secondColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _sideBarMenu(BuildContext context) {
  return Container(
    width: 60,
    height: SizeConfig.screenHeight * 0.2,
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
                  "About Me",
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
