part of 'pages.dart';

class DetailsPage extends StatefulWidget {
  final Function onBackPressed;
  final Restaurant restaurant;
  DetailsPage({this.onBackPressed, this.restaurant});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.restaurant.id,
            child: Container(
              height: SizeConfig.screenHeight * 0.4,
              width: double.infinity,
              child: FutureBuilder(
                future: RestaurantServices.getRestaurantImage(
                    widget.restaurant.pictureId),
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
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onBackPressed != null) {
                              widget.onBackPressed();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(0.8),
                            ),
                            child: Icon(
                              EvaIcons.arrowIosBack,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.2),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: SizeConfig.screenWidth -
                                        134, // 32 + 102
                                    child: Text(
                                      '${widget.restaurant.city}\n${widget.restaurant.name}',
                                      style: infoStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomRating(widget.restaurant.rating)
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
                            child: Text(
                              widget.restaurant.description,
                              style: infoStyle,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: mainColorDark,
                            ),
                            child: Center(
                              child: Text(
                                'Menus',
                                style: infoLightStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                          Consumer<RestaurantProvider>(
                            builder: (context, restaurantProvider, _) {
                              if (restaurantProvider.state ==
                                  ResultState.Loading) {
                                return CustomLoading();
                              }
                              if (restaurantProvider.state ==
                                  ResultState.Error) {
                                return Center(
                                  child: Text(restaurantProvider.message),
                                );
                              }
                              return restaurantProvider.state ==
                                      ResultState.HasData
                                  ? Menus(restaurantProvider.restaurant.menus)
                                  : Center(
                                      child: Text(restaurantProvider.message),
                                    );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
