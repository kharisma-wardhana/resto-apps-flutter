part of 'pages.dart';

class DetailsPage extends StatefulWidget {
  final Function onBackPressed;
  final Restaurant restaurant;
  DetailsPage({this.onBackPressed, this.restaurant});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.restaurant.id,
            child: Container(
              height: SizeConfig.screenHeight * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.restaurant.pictureId),
                      fit: BoxFit.cover)),
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
                              color: Colors.black.withOpacity(0.8)),
                          child: Icon(
                            EvaIcons.arrowIosBack,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.screenHeight * 0.2),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
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
                                  width:
                                      SizeConfig.screenWidth - 134, // 32 + 102
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
                              color: mainColorDark),
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
                        Menus(
                          widget.restaurant.menus.foods,
                          widget.restaurant.menus.drinks,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
