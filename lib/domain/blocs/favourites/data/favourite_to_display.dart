import 'package:flutter/material.dart';

class FavouriteToDisplay {
  static int _idIteratorValue = 0;
  static int get _idIterator {
    _idIteratorValue++;
    return _idIteratorValue;
  }

  final int id;
  final String label;
  final IconData iconData;

  FavouriteToDisplay({
    required this.label,
    required this.iconData,
  }) : id = _idIterator;
}
