import 'package:breaking_bad_api_flutter/domain/domain.dart';

class FavouritesTransferDto {
  List<Episode>? _episodes;
  List<Character>? _characters;
  List<Quote>? _quotes;

  List<Episode>? get episodes => _episodes;
  List<Character>? get characters => _characters;
  List<Quote>? get quotes => _quotes;

   FavouritesTransferDto({
    List<Episode>? episodes,
    List<Character>? characters,
    List<Quote>? quotes,
  }) : assert((episodes != null && characters == null && quotes == null) || (episodes == null && characters != null && quotes == null) || (episodes == null && characters == null && quotes != null)),
  _episodes = episodes,
  _characters = characters,
  _quotes = quotes ;
}
