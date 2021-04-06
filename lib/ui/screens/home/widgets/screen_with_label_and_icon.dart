import 'package:flutter/cupertino.dart';

class ScreenWithLabelAndIcon {
  final String label;
  final IconData iconData;
  final Widget screen;

  const ScreenWithLabelAndIcon({
    required this.label,
    required this.iconData,
    required this.screen,
  });
}
