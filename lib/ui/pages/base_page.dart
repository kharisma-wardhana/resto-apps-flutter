part of 'pages.dart';

class BasePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackPressed;
  final Widget child;
  final Color backgroundColor;
  final bool isLoading;

  BasePage(
      {this.title = "Title",
      this.subtitle = "Subtitle",
      this.onBackPressed,
      this.child,
      this.backgroundColor,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.1,
          color: mainColor,
        ),
        SafeArea(
            child: Container(
          height: SizeConfig.screenHeight * 0.19,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
            ),
            color: backgroundColor ?? secondColorDark,
          ),
        )),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: 140,
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        onBackPressed != null
                            ? GestureDetector(
                                onTap: () {
                                  if (onBackPressed != null) {
                                    onBackPressed();
                                  }
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 26),
                                  child: Icon(
                                    EvaIcons.arrowBackOutline,
                                    color: mainColor,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (title != null)
                                ? Text(
                                    title,
                                    style: titleStyle.copyWith(
                                      color: mainColor,
                                      fontSize: 30,
                                      letterSpacing: 2,
                                    ),
                                  )
                                : SizedBox(),
                            (subtitle != null)
                                ? Text(
                                    subtitle,
                                    style: subtitleStyle.copyWith(
                                      color: whiteColor,
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                EvaIcons.questionMarkCircleOutline,
                                size: 40,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  child ?? SizedBox()
                ],
              ),
            ],
          ),
        ),
        isLoading ? CustomLoading() : SizedBox()
      ],
    ));
  }
}
