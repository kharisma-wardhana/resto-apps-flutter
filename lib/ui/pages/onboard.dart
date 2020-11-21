part of 'pages.dart';

class OnboardPage extends StatefulWidget {
  final int initialPage;
  OnboardPage({this.initialPage = 0});

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentPage = 0;
  bool isLastIndex = false;
  PageController pageController;

  List<Map<String, String>> onboardData = [
    {
      "title": "Craving for something?",
      "text": "We ready to take your daily food needs\nto the next level.",
      "image": "assets/images/good_mood.png"
    },
    {
      "title": "Find best food in your area",
      "text": "Find and enjoy the food from best place around your area",
      "image": "assets/images/love_burger.png"
    },
    {
      "title": "From fast food to 5 star restaurant",
      "text":
          "We provide best place to you\nfrom fast food restaurant to 5 star restaurant",
      "image": "assets/images/fast_foods.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  Future<bool> _savePref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('first_launch', true);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 4,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                    isLastIndex = currentPage >= 2;
                  });
                },
                itemCount: onboardData.length,
                itemBuilder: (context, index) => OnboardContent(
                  title: onboardData[index]["title"],
                  subtitle: onboardData[index]["text"],
                  image: onboardData[index]["image"],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardData.length,
                        (index) => _buildDot(index: index),
                      ),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: isLastIndex
                            ? () {
                                Future<bool> saveFirstOpen = _savePref();
                                saveFirstOpen.then((value) {
                                  if (value) {
                                    Get.off(HomePage());
                                  }
                                });
                              }
                            : () {
                                setState(() {
                                  currentPage += 1;
                                });
                                pageController.jumpToPage(currentPage);
                              },
                        color: isLastIndex ? mainColor : secondColor,
                        child: Text(
                          isLastIndex ? "Get Started" : "Continue",
                          style: infoStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      child: Container(
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: currentPage == index ? 15 : 6,
        decoration: BoxDecoration(
          color: currentPage == index ? mainColor : Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
