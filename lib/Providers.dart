import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Categorya/CategoriyaPost.dart';
import 'Categorya/Model/CategpriyaModel.dart';
import 'LogIn/LogIn/Model/token.dart';
import 'Sebet/NotOrderedProduct/NotOrderProduct.dart';
import 'Sebet/NotOrderedProduct/NotOrderedProductModel.dart';
import 'language.dart';

class PriceState extends StateNotifier<List<double>> {
  static final pricepro = StateNotifierProvider<PriceState, List<double>>((
      ref) {
    return PriceState();
  });
  removeprice(int index,) {
    state.removeAt(index);
    setOptions(state);
  }

  void setOptions(options) {
    debugPrint(options.toString());
    state = [...options];
  }

  addindex(int index, double price) {
    state[index] += price;
    setOptions(state);
  }

  remove(int index, double price) {
    state[index] -= price;
    setOptions(state);
  }

  // the body of this will be provided below
  add() async {
    List<int> cartProduct = [];
    List<double> cart = [];
    double pricecheck = 0;
    List<List<int>> totalprice = [];
    await NoteOrderProductHttp().fetchAlbum().then((value) {
      for (int i = 0; i < value.notOrderedProducts.length; i++) {
        for (int j = 0; j < value.notOrderedProducts[i].orders.length; j++) {
          pricecheck +=value.notOrderedProducts[i].orders[j].isSelected==true? value.notOrderedProducts[i].orders[j].price*value.notOrderedProducts[i].orders[j].quantity:0;
          debugPrint("fsdfsdfsfds");
        }

        cart.add(pricecheck);
pricecheck=0;
        cartProduct = [];
        debugPrint(cart.toString());
      }
    });
    state = cart;
  }

  PriceState() : super(<double>[]);
}
class CounterState extends StateNotifier<List<List<int>>> {
  static final provider = StateNotifierProvider<CounterState, List<List<int>>>((
      ref) {
    return CounterState();
  });

  get last {
    return state;
  }

  int get length {
    print('len');
    return state.length;
  }

  void setOptions(options) {
    state = [...options];
  }
  removepro(int index, int proindex) {
    state[index].length!=1?state[index].removeAt(proindex):state.removeAt(index);
    setOptions(state);
  }
  addindex(int index, int proindex) {
    state[index][proindex] += 1;
    setOptions(state);
  }

  remove(int index, int proindex) {
    state[index][proindex] -= 1;
    setOptions(state);
  }

  // the body of this will be provided below
  add() async {
    List<int> cartProduct = [];
    List<double> cart = [];
    double pricecheck = 0;
    List<List<int>> totalprice = [];
    await NoteOrderProductHttp().fetchAlbum().then((value) {
      for (int i = 0; i < value.notOrderedProducts.length; i++) {
        for (int j = 0; j < value.notOrderedProducts[i].orders.length; j++) {
          cartProduct.add(value.notOrderedProducts[i].orders[j].quantity);
          debugPrint("fsdfsdfsfds");
        }

        totalprice.add(cartProduct);

        cartProduct = [];
        debugPrint(cart.toString());
      }
    });
    state = totalprice;
  }

  CounterState() : super(<List<int>>[]);
}

class CategoriyaPro extends StateNotifier<List<CategoriyaModel>> {
  static final catPor = StateNotifierProvider<CategoriyaPro, List<CategoriyaModel>>((
      ref) {
    return CategoriyaPro();
  });



  void setOptions(options) {
    state = [...options];
  }


  // the body of this will be provided below
  add() async {
    List<CategoriyaModel> cate = [];
   await GetCategoriya().caregoriyaAlbum().then((value) {
      cate = value;
    });

    state = cate;
  }

  CategoriyaPro() : super(<CategoriyaModel>[]);
}
class LanguageProvider extends StateNotifier<String> {
  static final catPor = StateNotifierProvider<LanguageProvider, String>((
      ref) {
    return LanguageProvider();
  });



  void setOptions(options) {
    state = options;
  }


  // the body of this will be provided below
  add() async {
    List<CategoriyaModel> cate = [];
    String url = "";
    await LanguageFileRead().then((value) {
      url = value;
    });

    state = url;
  }

  LanguageProvider() : super("");
}