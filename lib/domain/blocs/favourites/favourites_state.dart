import 'data/data.dart';

abstract class FavouritesState {
  const FavouritesState();
}

class FavouritesInitial extends FavouritesState {}

class FavouritesChosenFavourite extends FavouritesState {}

class FavouritesLoadedFavourite extends FavouritesState {
  final FavouritesTransferDto favouritesTransferDto;

  const FavouritesLoadedFavourite({
    required this.favouritesTransferDto,
  });
}