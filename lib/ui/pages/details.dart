part of 'pages.dart';

class DetailsPage extends StatefulWidget {
  final Function onBackPressed;
  final Restaurant restaurant;
  final int initialPage;
  DetailsPage({this.onBackPressed, this.restaurant, this.initialPage = 0});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedPage;
  PageController pageController;

  TextEditingController reviewerNameController = new TextEditingController();
  TextEditingController reviewerMessageController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/fast_foods.png",
                image: "$baseImageURL/${widget.restaurant.pictureId}",
                fit: BoxFit.cover,
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
                          EdgeInsets.only(top: SizeConfig.screenHeight * 0.15),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: CustomTabBar(
                              titles: ['Details', 'Menu', 'Review'],
                              selectedIndex: selectedPage,
                              onTap: (index) {
                                setState(() {
                                  selectedPage = index;
                                });
                                pageController.jumpToPage(selectedPage);
                              },
                            ),
                          ),
                          Container(
                            height: SizeConfig.screenHeight * 0.6,
                            child: PageView(
                              controller: pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  selectedPage = index;
                                });
                              },
                              children: [
                                Center(
                                  child: _detailRestaurant(
                                    context,
                                    widget.restaurant,
                                  ),
                                ),
                                Center(
                                  child: _buildRestaurantMenu(
                                    context,
                                    widget.restaurant,
                                  ),
                                ),
                                Center(
                                  child: _buildRestaurantReview(
                                    context,
                                    widget.restaurant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRestaurantMenu(BuildContext context, Restaurant restaurant) {
    return Column(
      children: [
        Consumer<RestaurantProvider>(
          builder: (context, restaurantProvider, _) {
            if (restaurantProvider.state == ResultState.Loading) {
              return CustomLoading();
            }
            if (restaurantProvider.state == ResultState.Error) {
              return Center(
                child: Text(restaurantProvider.message),
              );
            }
            return restaurantProvider.state == ResultState.HasData
                ? Menus(restaurantProvider.restaurant.menus)
                : Center(
                    child: Text(restaurantProvider.message),
                  );
          },
        ),
      ],
    );
  }

  Widget _buildRestaurantReview(BuildContext context, Restaurant restaurant) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: secondColor),
            color: whiteColor,
          ),
          child: TextField(
            controller: reviewerNameController,
            cursorColor: secondColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: infoStyle,
                hintText: 'Masukkan nama'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: secondColor),
            color: whiteColor,
          ),
          child: TextField(
            controller: reviewerMessageController,
            cursorColor: secondColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: infoStyle,
                hintText: 'Masukkan review'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.5,
          child: RaisedButton(
            color: mainColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            onPressed: () {
              String name = reviewerNameController.text;
              String review = reviewerMessageController.text;
              context.read<RestaurantProvider>().addReview(
                    restaurant.id,
                    name,
                    review,
                  );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Kirim',
                  style: infoStyle.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
                Icon(
                  EvaIcons.attach2,
                  color: whiteColor,
                ),
              ],
            ),
          ),
        ),
        Consumer<RestaurantProvider>(
          builder: (context, restaurantProvider, _) {
            if (restaurantProvider.state == ResultState.Loading) {
              return CircularProgressIndicator();
            }
            if (restaurantProvider.state == ResultState.Error) {
              return Center(
                child: Text(restaurantProvider.message),
              );
            }
            return restaurantProvider.state == ResultState.HasData
                ? CardReviews(restaurantProvider.listCustomerReview)
                : Center(
                    child: Text(restaurantProvider.message),
                  );
          },
        ),
      ],
    );
  }

  Widget _detailRestaurant(BuildContext context, Restaurant restaurant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              restaurant.name,
              style: infoStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            CustomRating(restaurant.rating),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          restaurant.city,
          style: infoStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 14, 0, 16),
          child: Text(
            restaurant.description,
            style: infoStyle,
          ),
        ),
      ],
    );
  }
}
