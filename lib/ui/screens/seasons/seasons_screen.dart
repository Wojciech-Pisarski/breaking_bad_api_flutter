import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class SeasonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: Center(
            child: Text('${AppScreenLabels.SeasonsScreen} screen'),
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(
        middle: Text(AppScreenLabels.SeasonsScreen),
      );
}
