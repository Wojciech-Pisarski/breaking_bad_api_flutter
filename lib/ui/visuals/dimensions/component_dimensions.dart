import 'dimensions.dart';

abstract class ComponentDimensions {
  static const double iosListViewIconSize = 29.0;
  static const double iosListViewDividerThickness = 0.8;
  static const double iosListViewDividerIndentHeight = Paddings.iosSmallPadding;
  static const double iosListViewItemWithNoIconHorizontalIndent =
      iosListViewIconSize + Paddings.iosNormalPadding;
  static const double characterImageHeightRatio = 0.5;
}
