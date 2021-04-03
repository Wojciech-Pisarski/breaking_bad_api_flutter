import 'package:flutter/cupertino.dart';
import 'ui/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoApp(
        home: HomeScreen(),
      );
}
