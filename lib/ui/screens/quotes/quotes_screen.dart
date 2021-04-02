import 'package:flutter/cupertino.dart';

class QuotesScreen extends StatelessWidget {
  static const String LABEL = "Quotes";
  static const IconData ICON = CupertinoIcons.quote_bubble;

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
