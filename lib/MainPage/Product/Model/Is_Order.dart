import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:serpay/IpAdress.dart';

import '../../../LogIn/LogIn/Model/token.dart';
import 'Is_Order_Model.dart';
import 'package:http/http.dart' as http;
class Is_Order{
  late String token="";
  late Is_Order_Model is_order_model;
  Future<Is_Order_Model> fetchAlbum(String productId,String sizeId) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });

    final response =
    await http.get(Uri.parse(
        "${IpAddress().ipAddress}/users/is-ordered?product_id=${productId}&product_size_id=${sizeId}"),
      headers:  <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      },);

    var decodedJson = json.decode(response.body);
debugPrint(response.body);

    is_order_model = Is_Order_Model.fromJson(decodedJson);

    return is_order_model;
  }
}