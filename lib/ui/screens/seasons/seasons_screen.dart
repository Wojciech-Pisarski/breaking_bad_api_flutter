import 'package:flutter/cupertino.dart';

class SeasonsScreen extends StatelessWidget {
  static final String LABEL = "Seasons";
  static final IconData ICON = CupertinoIcons.play_rectangle;

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: Center(
            child: Text(LABEL),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(LABEL),
      );
}
