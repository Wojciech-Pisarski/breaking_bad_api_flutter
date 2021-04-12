import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter/material.dart';

class IosListViewEdgeDivider extends StatelessWidget {
  final bool isTopDivider;

  const IosListViewEdgeDivider({
    this.isTopDivider = true,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: AppColors.screenWhiteBackground,
        height: ComponentDimensions.iosListViewDividerIndentHeight,
        child: Align(
          alignment: _chooseAlignmentForDivider(),
          child: Container(
            height: ComponentDimensions.iosListViewDividerThickness,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: DividerTheme.of(context).color ??
                      Theme.of(context).dividerColor,
                  width: ComponentDimensions.iosListViewDividerThickness,
                ),
              ),
            ),
          ),
        ),
      );

  Alignment _chooseAlignmentForDivider() =>
      isTopDivider ? Alignment.topCenter : Alignment.bottomCenter;
}
