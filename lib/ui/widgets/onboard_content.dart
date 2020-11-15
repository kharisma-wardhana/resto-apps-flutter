part of 'widgets.dart';

class OnboardContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  OnboardContent({this.title, this.subtitle, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: <Widget>[
            // note: BACKDROP
            Container(
              height: SizeConfig.screenHeight * 0.65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.65 + 10,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment(0, 1),
                  end: Alignment(0, 0.03),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.white,
          margin: EdgeInsets.only(
            top: SizeConfig.screenHeight * 0.6,
          ),
          child: Column(
            children: [
              Container(
                height: 25,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0),
                    ],
                    begin: Alignment(0, 1),
                    end: Alignment(0, 0.9),
                  ),
                ),
              ),
              Text(
                title,
                style: infoStyle,
              ),
              SizedBox(height: 30),
              Text(
                subtitle,
                style: infoStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
