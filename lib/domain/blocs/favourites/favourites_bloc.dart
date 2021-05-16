import 'package:breaking_bad_api_flutter/domain/blocs/favourites/favourites_state.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breaking_bad_api_flutter/domain/domain.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  static final FavouritesDisplayedData _favouritesDisplayedData =
      FavouritesDisplayedData(
    favouritesToDisplay: <FavouriteToDisplay>[
      FavouriteToDisplay(
        label: AppScreenLabels.EpisodesScreen,
        iconData: AppIconDatas.EpisodesScreen,
      ),
      FavouriteToDisplay(
        label: AppScreenLabels.CharactersScreen,
        iconData: AppIconDatas.CharactersScreen,
      ),
      FavouriteToDisplay(
        label: AppScreenLabels.QuotesScreen,
        iconData: AppIconDatas.QuotesScreen,
      ),
    ],
  );

  FavouritesBloc() : super(FavouritesInitial());

  @override
  Stream<FavouritesState> mapEventToState(FavouritesEvent event) async* {
    if (event is FavouritesChooseFavourite) {
      yield FavouritesChosenFavourite();
      final FavouritesTransferDto favouritesTransferDto =
          await _buildFavouritesTransferDto(event.favouriteId);
      yield FavouritesLoadedFavourite(
          favouritesTransferDto: favouritesTransferDto);
    }
  }

  Future<FavouritesTransferDto> _buildFavouritesTransferDto(
      int favouriteId) async {
    final FavouritesTransferDto favouritesTransferDto;
    final String label = _favouritesDisplayedData.favouritesToDisplay
        .firstWhere((element) => element.id == favouriteId)
        .label;
    switch (label) {
      case AppScreenLabels.EpisodesScreen:
        final List<int> favEpisodesIds =
            await Episode.getAllFavouriteEpisodesIds();
        final List<Map<String, dynamic>> favEpisodesData =
            await Episode.getEpisodesDataForIds(favEpisodesIds);
        final List<Episode> favEpisodes =
            Episode.getEpisodesFromEpisodesDataList(favEpisodesData);
        favouritesTransferDto = FavouritesTransferDto(episodes: favEpisodes);
        break;
      case AppScreenLabels.CharactersScreen:
        final List<int> favCharactersIds =
            await Character.getAllFavouriteCharactersIds();
        final List<Map<String, dynamic>> favCharactersData =
            await Character.getCharactersDataFromIds(favCharactersIds);
        final List<Character> favCharacters =
            Character.getCharactersFromCharactersData(favCharactersData);
        favouritesTransferDto =
            FavouritesTransferDto(characters: favCharacters);
        break;
      default:
        final List<int> favQuotesIds = await Quote.getAllFavouriteQuotesIds();
        final List<Map<String, dynamic>> favQuotesData =
            await Quote.getQuotesDataFromIds(favQuotesIds);
        final List<Quote> favQuotes =
            Quote.getQuotesFromQuotesData(favQuotesData);
        favouritesTransferDto = FavouritesTransferDto(quotes: favQuotes);
        break;
    }
    return favouritesTransferDto;
  }
}
