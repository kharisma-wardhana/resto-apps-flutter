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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: secondColor,
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      color: mainColor,
                      width: SizeConfig.screenWidth,
                      height: 65,
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: IconButton(
                              icon: Icon(
                                EvaIcons.arrowIosBack,
                                color: secondColorDark,
                              ),
                              iconSize: 30,
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Text(
                                "Search Restaurant",
                                style: infoStyle.copyWith(
                                  fontSize: 20,
                                  color: secondColorDark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: secondColor),
                                color: whiteColor,
                              ),
                              child: TextField(
                                controller: searchController,
                                cursorColor: secondColor,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: infoStyle,
                                    hintText: 'Masukkan nama restaurant'),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 8),
                            child: IconButton(
                              icon: Icon(
                                EvaIcons.search,
                                color: whiteColor,
                              ),
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
                        ? Container(
                            height: SizeConfig.screenHeight * 0.75,
                            child: Consumer<RestaurantProvider>(
                              builder: (context, dataProvider, _) {
                                if (dataProvider.searchState ==
                                    ResultState.Loading) {
                                  return CustomLoading();
                                }
                                if (dataProvider.searchState ==
                                        ResultState.Error ||
                                    dataProvider.searchState ==
                                        ResultState.NoData) {
                                  return Center(
                                    child: Text(
                                      dataProvider.message,
                                      style: infoStyle,
                                    ),
                                  );
                                }
                                return (dataProvider.searchState ==
                                        ResultState.HasData)
                                    ? ListView(
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          Column(
                                            children: dataProvider
                                                .listSearchRestaurant
                                                .map(
                                                  (resto) => Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 8,
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                                RestaurantProvider>()
                                                            .fetchRestaurant(
                                                                resto.id)
                                                            .then((value) {
                                                          if (value
                                                              is Restaurant) {
                                                            Get.to(
                                                              DetailsPage(
                                                                restaurant:
                                                                    resto,
                                                                onBackPressed:
                                                                    () {
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
                                    : SizedBox();
                              },
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardRestaurant(BuildContext context, Restaurant restaurant) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
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
      ),
    );
  }
}
