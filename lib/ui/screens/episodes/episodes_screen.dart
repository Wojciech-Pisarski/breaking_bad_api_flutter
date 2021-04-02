import 'package:flutter/cupertino.dart';

class EpisodesScreen extends StatelessWidget {
  final String label = "Episodes";

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: Center(
            child: Text(label),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(label),
      );
}
