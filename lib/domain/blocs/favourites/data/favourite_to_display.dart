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

  // maybe id should be distributed by the program?
  FavouriteToDisplay({
    //required this.id,
    required this.label,
    required this.iconData,
  }):
    id = _idIterator;

}