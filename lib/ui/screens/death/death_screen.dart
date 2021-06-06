import 'package:flutter/cupertino.dart';
import 'package:breaking_bad_api_flutter/domain/blocs/blocs.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class DeathScreen extends StatelessWidget {
  final DeathToDisplay deathToDisplay;

  const DeathScreen(this.deathToDisplay);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        backgroundColor: AppColors.screenGrayBackground,
        navigationBar: _buildCupertinoNavigationBar(),
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              _buildDeathLabel(),
              _buildDeathDescription(),
            ],
          ),
        ),
      );

  CupertinoNavigationBar _buildCupertinoNavigationBar() =>
      CupertinoNavigationBar(middle: Text(AppScreenLabels.DeathScreen));

  Widget _buildDeathLabel() => Container(
        height: 200,
        child: Center(
          child: Text(
            deathToDisplay.death,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      );

  Column _buildDeathDescription() => Column(
        children: [
          ElementDescriptionRow(
            label: AppLabels.Cause,
            content: deathToDisplay.cause,
          ),
          ElementDescriptionRow(
            label: AppLabels.Responsible,
            content: deathToDisplay.responsible,
          ),
          ElementDescriptionRow(
            label: AppLabels.LastWords,
            content: deathToDisplay.lastWords,
          ),
          ElementDescriptionRow(
            label: AppLabels.Season,
            content: deathToDisplay.season,
          ),
          ElementDescriptionRow(
            label: AppLabels.Episode,
            content: deathToDisplay.episode,
          ),
          ElementDescriptionRow(
            label: AppLabels.NumberOfDeaths,
            content: deathToDisplay.numberOfDeaths,
          ),
        ],
      );
}
