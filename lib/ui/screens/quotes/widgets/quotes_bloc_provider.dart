import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../quotes.dart';

class QuotesBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            QuotesBloc()..add(QuotesRefreshQuotes()),
        child: QuotesScreen(),
      );
}
