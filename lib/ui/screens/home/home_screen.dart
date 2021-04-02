import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class HomeScreen extends StatelessWidget {
  //TODO: In future tasks this should be moved to bloc logic
  final List<ScreenWithLabelAndIcon> _screensWithLabelAndIcon = [
    ScreenWithLabelAndIcon(
      label: SeasonsScreen.LABEL,
      iconData: SeasonsScreen.ICON,
      screen: SeasonsScreen(),
    ),
    ScreenWithLabelAndIcon(
      label: CharactersScreen.LABEL,
      iconData: CharactersScreen.ICON,
      screen: CharactersScreen(),
    ),
    ScreenWithLabelAndIcon(
      label: QuotesScreen.LABEL,
      iconData: QuotesScreen.ICON,
      screen: QuotesScreen(),
    ),
    ScreenWithLabelAndIcon(
      label: DeathsScreen.LABEL,
      iconData: DeathsScreen.ICON,
      screen: DeathsScreen(),
    ),
    ScreenWithLabelAndIcon(
      label: FavouritesScreen.LABEL,
      iconData: FavouritesScreen.ICON,
      screen: FavouritesScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: _buildCupertinoTabBarItems(),
        ),
        tabBuilder: (context, index) => CupertinoTabView(
          builder: (context) => _screensWithLabelAndIcon[index].screen,
        ),
      );

  List<BottomNavigationBarItem> _buildCupertinoTabBarItems() {
    final List<BottomNavigationBarItem> tabBarItems = [];
    _screensWithLabelAndIcon.forEach(
      (element) => tabBarItems.add(
        BottomNavigationBarItem(
          label: element.label,
          icon: Icon(element.iconData),
        ),
      ),
    );
    return tabBarItems;
  }
}
