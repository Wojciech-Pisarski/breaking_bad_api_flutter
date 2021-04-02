import 'package:flutter/cupertino.dart';

class FavouritesScreen extends StatelessWidget {
  static const String LABEL = "Favourites";
  static const IconData ICON = CupertinoIcons.heart;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: Center(
            child: Text('$LABEL screen'),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(LABEL),
      );
}
