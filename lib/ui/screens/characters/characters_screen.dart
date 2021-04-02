import 'package:flutter/cupertino.dart';

class CharactersScreen extends StatelessWidget {
  static const String LABEL = "Characters";
  static const IconData ICON = CupertinoIcons.person_2;

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
