import 'package:flutter/cupertino.dart';

class IosListViewItemData {
  final int id;
  final String label;
  final IconData? icon;

  const IosListViewItemData({
    required this.id,
    required this.label,
    this.icon,
  });
}
