part of 'pages.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Stack(children: [
        Container(
          color: lightColor,
        ),
        SafeArea(
          child: Column(children: [
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
                        "Setting",
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
            Consumer<PreferencesProvider>(
              builder: (context, provider, _) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      child: ListTile(
                        title: Text(
                          'Schedule Notification',
                        ),
                        trailing: Consumer<AlarmProvider>(
                          builder: (context, scheduled, _) {
                            return Switch.adaptive(
                              activeColor: secondColorDark,
                              value: provider.isNotificationActive,
                              onChanged: (value) async {
                                scheduled.scheduledRestaurants(value);
                                provider.enableNotification(value);
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ]),
        )
      ]),
    );
  }
}
