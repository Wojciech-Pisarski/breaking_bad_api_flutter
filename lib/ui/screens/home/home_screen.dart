import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class HomeScreen extends StatelessWidget {
  //TODO: In future tasks this should be moved to bloc logic
  final List<ScreenWithLabelAndIcon> _screensWithLabelAndIcon = [
    ScreenWithLabelAndIcon(
      label: AppScreenLabels.SeasonsScreen,
      iconData: AppIconDatas.SeasonsScreen,
      screen: SeasonsBlocProvider(),
    ),
    ScreenWithLabelAndIcon(
      label: AppScreenLabels.CharactersScreen,
      iconData: AppIconDatas.CharactersScreen,
      screen: CharactersBlocProvider(),
    ),
    ScreenWithLabelAndIcon(
      label: AppScreenLabels.QuotesScreen,
      iconData: AppIconDatas.QuotesScreen,
      screen: QuotesBlocProvider(),
    ),
    ScreenWithLabelAndIcon(
      label: AppScreenLabels.DeathsScreen,
      iconData: AppIconDatas.DeathsScreen,
      screen: DeathsScreen(),
    ),
    ScreenWithLabelAndIcon(
      label: AppScreenLabels.FavouritesScreen,
      iconData: AppIconDatas.FavouritesScreen,
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
          icon: Icon(
            element.iconData,
            size: ComponentDimensions.iosListViewIconSize,
          ),
        ),
      ),
    );
    return tabBarItems;
  }
}
