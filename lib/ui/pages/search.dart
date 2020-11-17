part of 'pages.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = new TextEditingController();
  bool showSearchResult = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      child: IconButton(
                        icon: Icon(
                          EvaIcons.arrowIosBack,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                      ),
                    ),
                    Container(
                      width: 50,
                      child: IconButton(
                        icon: Icon(EvaIcons.search),
                        onPressed: () {
                          String searchQuery = searchController.text;
                          context
                              .read<RestaurantProvider>()
                              .searchRestaurant(searchQuery);
                          setState(() {
                            showSearchResult = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              (showSearchResult)
                  ? Expanded(
                      child: Consumer<RestaurantProvider>(
                        builder: (context, restaurantProvider, _) {
                          if (restaurantProvider.searchState ==
                              ResultState.Loading) {
                            return CustomLoading();
                          }
                          if (restaurantProvider.searchState ==
                              ResultState.Error) {
                            return Center(
                              child: Text(
                                restaurantProvider.message,
                                style: infoStyle,
                              ),
                            );
                          }
                          return (restaurantProvider.searchState ==
                                  ResultState.HasData)
                              ? ListView(
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Column(
                                      children: restaurantProvider
                                          .listSearchRestaurant
                                          .map(
                                            (resto) => Padding(
                                              padding: EdgeInsets.only(
                                                top: defaultMargin,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          RestaurantProvider>()
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
                                                child: _cardRestaurant(
                                                    context, resto),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Text(
                                    restaurantProvider.message,
                                    style: infoStyle,
                                  ),
                                );
                        },
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardRestaurant(BuildContext context, Restaurant restaurant) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: FutureBuilder(
                future:
                    RestaurantServices.getRestaurantImage(restaurant.pictureId),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CustomLoading();
                  }
                  if (snapshot.data == null) {
                    return Image.asset(
                      'assets/images/fast_foods.png',
                      fit: BoxFit.cover,
                    );
                  }
                  return Image.network(
                    snapshot.data,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                // height: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.name,
                      style: infoStyle,
                    ),
                    Text(
                      restaurant.city,
                      style: infoStyle,
                    ),
                    CustomRating(
                      restaurant.rating,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
