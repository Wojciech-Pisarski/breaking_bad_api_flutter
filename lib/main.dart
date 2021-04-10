import 'package:breaking_bad_api_flutter/ui/widgets/loading_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'ui/ui.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => LoadingBloc(),
        child: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    DatabaseUtility.initializeDatabase();
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<LoadingBloc, LoadingState>(
        builder: (context, state) => Stack(
          alignment: Alignment.center,
          children: [
            CupertinoApp(
              home: HomeScreen(),
            ),
            _buildLoader(state),
          ],
        ),
      );

  //TODO: Implement :
  Widget _buildLoader(LoadingState state) =>
      state is LoadingStarted ? LoadingOverlay() : SizedBox.shrink();
}
