import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';
import '../quote.dart';

class QuoteBlocProvider extends StatelessWidget {
  final QuotesTransferDto quotesTransferDto;

  const QuoteBlocProvider({
    required this.quotesTransferDto,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => QuoteBloc(quotesTransferDto),
        child: QuoteScreen(),
      );
}
