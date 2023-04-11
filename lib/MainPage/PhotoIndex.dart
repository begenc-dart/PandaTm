import 'package:flutter/material.dart';

import '../Categorya/Model/CategpriyaModel.dart';

class ProductIndex with ChangeNotifier {
  int _currentPos;

  ProductIndex(this._currentPos);

  int get sana => _currentPos;

  set sana(int value) {
    _currentPos = value;
  }

  check(int index) {
    sana = index;
    notifyListeners();
  }
}

class ChangeNot with ChangeNotifier {
  List<CategoriyaModel> _currentPos;

  ChangeNot(this._currentPos);

  List<CategoriyaModel> get sana => _currentPos;

  set sana(List<CategoriyaModel> value) {
    _currentPos = value;
    notifyListeners();
  }
}