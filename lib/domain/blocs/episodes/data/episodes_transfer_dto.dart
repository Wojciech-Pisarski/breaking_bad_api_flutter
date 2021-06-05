import 'package:breaking_bad_api_flutter/domain/domain.dart';

class EpisodesTransferDto {
  final Episode episode;
  final bool isAddedToFavourites;

  const EpisodesTransferDto({
    required this.episode,
    required this.isAddedToFavourites,
  });
}
