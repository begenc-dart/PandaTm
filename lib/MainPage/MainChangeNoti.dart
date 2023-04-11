import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../Sebet/NotOrderedProduct/NotOrderProduct.dart';
import '../Sebet/NotOrderedProduct/NotOrderedProductModel.dart';

class BannerIndex with ChangeNotifier {
  int _currentPos;

  BannerIndex(this._currentPos);

  int get sana => _currentPos;

  set sana(int value) {
    _currentPos = value;
  }

  check(int index) {
    sana = index;
    notifyListeners();
  }
}

class SearchHistory with ChangeNotifier {
  Box hives;

  SearchHistory(this.hives);

  Box get sana => hives;

  set sana(Box value) {
    hives = value;
  }

  delete() {
    hives.clear();
    notifyListeners();
  }

  addSotare(String query) {
    hives.add(query);
    notifyListeners();
  }

  getHive(int query) {
    return hives.getAt(query);
    notifyListeners();
  }

  int lenght() {
    return hives.length;
    notifyListeners();
  }

  removedele(int query) {
    return hives.deleteAt(query);
    notifyListeners();
  }
}
class Price with ChangeNotifier{

  List<double> _sana;
  Price(this._sana);
  double a=0;
  List<double> get sana => _sana;
  set sana(List<double> value) {
    _sana = value;
    debugPrint(_sana.toString());
  }
removeall(int index){
    _sana.removeAt(index);
    notifyListeners();
}
  addpro(int index,double price) {
    _sana[index]=_sana[index]+price;
    notifyListeners();
  }
  removePro(int index,double price) {
    _sana[index]=_sana[index]-price;
    notifyListeners();
  }
  
  nola(int index) {
    _sana[index]=0;
    notifyListeners();
  }
allPrice(){
    for(int i=0;i<_sana.length;i++){
      a=a+_sana[i];
    }
}
}
class SayacModel{
  final List<int> sayac;
  SayacModel({required this.sayac});
}
// final sayacStateProvider = StateProvider<Future<List<int>>>(((ref)async {
//   List<double> cart = [];
//   double pricecheck = 0;
//   await NoteOrderProductHttp().fetchAlbum(isrefest: true).then((value) {
//     for (int i = 0; i < value.notOrderedProducts.length; i++) {
//       for (int j = 0; j < value.notOrderedProducts[i].orders.length; j++) {
//         pricecheck += value.notOrderedProducts[i].orders[j].totalPrice;
//         // cartProduct.add(value.notOrderedProducts[i].orders[j].quantity);
//         debugPrint("fsdfsdfsfds");
//       }
//       cart.add(pricecheck);
//       // totalprice.add(cartProduct);
//       pricecheck = 0;
//       // cartProduct = [];
//       // debugPrint(totalprice.toString());
//     }
//   });
//   return cart;
// }));
// final sayacNotifierProvider =
// StateNotifierProvider<SayacManager, SayacModel>(((ref) {
//   return SayacManager();
// }));
class Counter with ChangeNotifier{

  List<List<int>> _count;
  Counter(this._count);


  List<List<int>> get count => _count;

  set count(List<List<int>> value) {
    _count = value;
    debugPrint(_count.toString());
  }
  removeall(int index,int proindex){
    debugPrint(_count[index].length.toString());
  _count[index].length==1? _count.removeAt(index):_count[index].removeAt(proindex);
    notifyListeners();
  }
  addpro(int index,int proindex) {
    _count[index][proindex]++;
    notifyListeners();
  }
  remove(int index,int proindex) {
    _count[index][proindex]--;
    notifyListeners();
  }
  nully(int index,int proindex) {
    _count[index][proindex]=0;
    notifyListeners();
  }

}