import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../IpAdress.dart';
import '../Database/checkSignUp.dart';
import '../Database/token.dart';
import '../Model/Action.dart';
import '../Model/mainModel.dart';


class AksiyaProdutModel {
  String checkLike = "";
  String? token;
  String ip = IpAddress().ipAddress;
  ActionModel? action;
  CheckSignUp checkSignUp = new CheckSignUp();
  Future<ActionModel> fetchAlbum() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    final response =
        await http.get(Uri.parse("${ip}/public/products/action?limit=3"), );
debugPrint("fdasfd"+response.body);
    var decodedJson = json.decode(response.body);

    action = ActionModel.fromJson(decodedJson);

    return action!;
  }
}



class NewProductsModel {
  String checkLike = "";
  String? token;
  String ip = IpAddress().ipAddress;
  late NewAndProduct newProducy;
  CheckSignUp checkSignUp = new CheckSignUp();
  Future<NewAndProduct> fetchAlbum() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    final response =
    await http.get(Uri.parse("${ip}/public/products/new?limit=3"), );
    debugPrint("fdasfd"+response.body);
    var decodedJson = json.decode(response.body);

    newProducy = NewAndProduct.fromJson(decodedJson);

    return newProducy;
  }
}