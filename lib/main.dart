import 'package:flutter/cupertino.dart';
import 'ui/ui.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) => CupertinoApp(
        home: HomeScreen(),
      );

  @override
  void initState() {
    super.initState();
    DatabaseUtility.initializeDatabase();
  }
}
