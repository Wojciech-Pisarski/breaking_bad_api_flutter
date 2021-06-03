import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../quotes.dart';

class QuotesBlocProvider extends StatelessWidget {
  final FavouritesTransferDto? favouritesTransferDto;

  const QuotesBlocProvider({
    this.favouritesTransferDto,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => favouritesTransferDto != null
            ? QuotesBloc(favouritesTransferDto: favouritesTransferDto)
            : QuotesBloc()
          ..add(QuotesRefreshQuotes()),
        child: QuotesScreen(),
      );
}
