abstract class FavouritesEvent {
  const FavouritesEvent();
}

class FavouritesChooseFavourite extends FavouritesEvent {
  final int favouriteId;

  const FavouritesChooseFavourite({
    required this.favouriteId,
  });
}