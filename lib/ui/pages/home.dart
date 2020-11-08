part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                  Icon(
                    EvaIcons.bookmarkOutline,
                    color: secondColorDark,
                    size: 40,
                  ),
                  Text(
                    "Foodies",
                    style: infoStyle.copyWith(
                      fontSize: 28,
                      letterSpacing: 3,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(AboutPage());
                      },
                      child: Icon(
                        EvaIcons.questionMarkCircle,
                        color: secondColorDark,
                        size: 40,
                      ),
                    ),
                  ))
                ],
              )),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              height: SizeConfig.screenHeight * 0.8,
              child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/mock_data.json'),
                  builder: (context, snapshot) {
                    final List<Restaurant> restaurants =
                        parseRestaurants(snapshot.data);
                    return restaurants.length != 0
                        ? ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: restaurants
                                    .map((resto) => Padding(
                                          padding: EdgeInsets.only(
                                              left: (resto == restaurants.first)
                                                  ? defaultMargin + 38
                                                  : 0,
                                              right: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                DetailsPage(
                                                  restaurant: resto,
                                                  onBackPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              );
                                            },
                                            child:
                                                restaurantItem(context, resto),
                                          ),
                                        ))
                                    .toList(),
                              )
                            ],
                          )
                        : CustomLoading();
                  }),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
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
                            EvaIcons.alertCircle,
                            color: secondColorDark,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "New",
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget restaurantItem(BuildContext context, Restaurant restaurant) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
            colors: [secondColorDark, secondColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft)),
    child: Column(
      children: [
        Hero(
          tag: restaurant.id,
          child: Container(
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(restaurant.pictureId)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          restaurant.city,
          style: infoLightStyle.copyWith(
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          restaurant.name,
          style: infoLightStyle.copyWith(
            fontSize: 18,
            decoration: TextDecoration.none,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        SizedBox(
          width: 280,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              restaurant.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 12,
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
