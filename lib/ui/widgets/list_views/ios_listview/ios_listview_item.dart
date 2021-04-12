import 'package:flutter/material.dart';
import 'package:breaking_bad_api_flutter/ui/ui.dart';

class IosListViewItem extends StatelessWidget {
  final String text;
  final void Function() onPress;
  final IconData? leftIconData;

  const IosListViewItem({
    required this.text,
    required this.onPress,
    this.leftIconData,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPress,
        child: Container(
          color: AppColors.screenWhiteBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leftIconData != null) _buildLeftIcon(),
              _buildLabel(),
              _buildRightIcon(context),
            ],
          ),
        ),
      );

  Widget _buildLeftIcon() => FittedBox(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: Paddings.iosSmallPadding,
          ),
          width: ComponentDimensions.iosListViewIconSize,
          height: ComponentDimensions.iosListViewIconSize,
          child: Icon(
            leftIconData,
            size: ComponentDimensions.iosListViewIconSize,
          ),
        ),
      );

  Widget _buildLabel() => Flexible(
        child: Container(
          alignment: Alignment.centerLeft,
          margin: leftIconData == null
              ? const EdgeInsets.symmetric(
                  horizontal: Paddings.iosSmallPadding,
                )
              : null,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );

  Widget _buildRightIcon(BuildContext context) => FittedBox(
        child: Container(
          margin: const EdgeInsets.only(
            right: Paddings.iosSmallPadding,
          ),
          width: ComponentDimensions.iosListViewIconSize,
          height: ComponentDimensions.iosListViewIconSize,
          child: Icon(
            AppIconDatas.ChevronForward,
            color: Theme.of(context).disabledColor,
          ),
        ),
      );
}
