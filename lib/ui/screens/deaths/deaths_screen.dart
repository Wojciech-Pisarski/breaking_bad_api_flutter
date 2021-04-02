import 'package:flutter/cupertino.dart';

class DeathsScreen extends StatelessWidget {
  static const String LABEL = "Deaths";
  static const IconData ICON = CupertinoIcons.multiply_circle;

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
