part of 'pages.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: lightColor,
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  color: secondColorDark,
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
                            color: whiteColor,
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
                            "Favorite Restaurant",
                            style: infoStyle.copyWith(
                              fontSize: 20,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Consumer<FavoriteProvider>(
                      builder: (context, provider, _) {
                    if (provider.state == ResultState.HasData) {
                      return ListView.builder(
                        itemCount: provider.favorites?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<RestaurantProvider>()
                                  .fetchRestaurant(
                                      provider.favorites![index].id)
                                  .then((value) {
                                if (value is Restaurant) {
                                  Get.to(
                                    () => DetailsPage(
                                      restaurant: provider.favorites![index],
                                      onBackPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  );
                                }
                              });
                            },
                            child: _cardRestaurant(
                              context,
                              provider.favorites![index],
                            ),
                          );
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                            'Empty Favorite Restaurant',
                            textAlign: TextAlign.center,
                          )
                        ],
                      );
                    }
                  }),
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
        vertical: 8,
      ),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              right: 8,
            ),
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/fast_foods.png",
                image: "$imageURL/${restaurant.pictureId}",
                fit: BoxFit.cover,
              ),
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
