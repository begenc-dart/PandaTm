import 'package:flutter/material.dart';
import 'package:serpay/MainPage/Model/RandomProduct.dart';

class MainPageProv with ChangeNotifier {
  List _currentPos;

  MainPageProv(this._currentPos);

  List get sana => _currentPos;

  set sana(List value) {
    _currentPos = value;
    notifyListeners();
  }

  addPro(List addPro){
    _currentPos.addAll(addPro);
    notifyListeners();
  }
  evulPro(List addPro){
    _currentPos=addPro;
    notifyListeners();
  }
}
