part of 'pages.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: secondColorDark,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            width: 50,
                            height: 50,
                            child: Icon(
                              EvaIcons.arrowIosBack,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "About Me",
                      style: titleStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: defaultMargin),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: GestureDetector(
                    onTap: () async {
                      var url = 'https://github.com/kharisma-wardhana';
                      if (await canLaunch(url)) {
                        await launch(
                          url,
                          forceSafariVC: true,
                          forceWebView: true,
                          enableJavaScript: true,
                        );
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: secondColorDark,
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        "assets/images/user.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Kharisma Wardhana",
                style: infoStyle,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Software Engineer",
                style: infoStyle,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Yogyakarta",
                style: infoStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Text(
                  "Passionate Software Engineer that always eager to learn something new. Currently focus learn flutter and webAR",
                  style: infoStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
