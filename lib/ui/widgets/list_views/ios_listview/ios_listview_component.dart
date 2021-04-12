import 'package:breaking_bad_api_flutter/ui/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosListViewComponent extends StatelessWidget {
  final List<IosListViewItemData> itemsData;
  final void Function(int elementId) onItemPress;

  const IosListViewComponent({
    required this.itemsData,
    required this.onItemPress,
  });

  @override
  Widget build(BuildContext context) => CupertinoScrollbar(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => _buildDivider(index),
          itemBuilder: (context, index) => _buildIosListViewItem(index),
          itemCount: itemsData.length,
        ),
      );

  Widget _buildDivider(int index) => Container(
        color: AppColors.screenWhiteBackground,
        child: Divider(
          thickness: ComponentDimensions.iosListViewDividerThickness,
          indent: _chooseDividerIndent(index),
        ),
      );

  double _chooseDividerIndent(int rowIndex) => itemsData[rowIndex].icon != null
      ? ComponentDimensions.iosListViewItemWithNoIconHorizontalIndent
      : Paddings.iosSmallPadding;

  Widget _buildIosListViewItem(int index) {
    final IosListViewItem iosListViewRow = IosListViewItem(
      text: itemsData[index].label,
      onPress: () => onItemPress(itemsData[index].id),
      leftIconData: itemsData[index].icon,
    );
    if (index == 0 || index == itemsData.length - 1) {
      return Column(
        children: [
          if (index == 0 && index != itemsData.length - 1)
            _buildTopIosListViewRow(),
          iosListViewRow,
          if (index == itemsData.length - 1 && index != 0)
            _buildBottomIosListViewRow(),
        ],
      );
    } else {
      return iosListViewRow;
    }
  }

  Widget _buildTopIosListViewRow() => Column(
        children: [
          SizedBox(
            height: ComponentDimensions.iosListViewIconSize,
          ),
          IosListViewEdgeDivider(),
        ],
      );

  Widget _buildBottomIosListViewRow() => Column(
        children: [
          IosListViewEdgeDivider(
            isTopDivider: false,
          ),
          SizedBox(
            height: ComponentDimensions.iosListViewIconSize,
          ),
        ],
      );
}
