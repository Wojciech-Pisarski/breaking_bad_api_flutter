import 'package:breaking_bad_api_flutter/domain/domain.dart';

class DeathsTransferDto {
  final List<Death> deaths;

  const DeathsTransferDto({
    required this.deaths,
  });
}
