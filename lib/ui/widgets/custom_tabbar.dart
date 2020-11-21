part of 'widgets.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int) onTap;

  CustomTabBar({@required this.titles, this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: titles
                .map(
                  (e) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 40,
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              if (onTap != null) {
                                onTap(titles.indexOf(e));
                              }
                            },
                            child: Column(
                              children: [
                                Text(
                                  e,
                                  style: (titles.indexOf(e) == selectedIndex)
                                      ? infoStyle.copyWith(
                                          fontWeight: FontWeight.w800,
                                        )
                                      : infoStyle,
                                ),
                                Container(
                                  width: 50,
                                  height: 4,
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color:
                                          (titles.indexOf(e) == selectedIndex)
                                              ? mainColor
                                              : Colors.transparent),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
