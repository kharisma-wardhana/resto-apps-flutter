part of 'widgets.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: SizedBox(
        width: 300,
        height: 300,
        child: LottieBuilder.asset("assets/animations/loading.json"),
      ),
    );
  }
}
