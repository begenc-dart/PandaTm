import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:serpay/Servers/Model/AllFreeProduct.dart';
import 'package:serpay/Servers/Model/OneFreeProduct.dart';
import '../../IpAdress.dart';
import '../../LogIn/LogIn/Model/token.dart';

class OneFreeProductServer {
  String token = "";
  String ip = IpAddress().ipAddress;
  late OneFreeProduct _allFreeProduct;

  Future<OneFreeProduct> fetchAlbum(String ipAddress) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });

    final response = await http.get(
      Uri.parse("$ip/public/free-products/$ipAddress"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
debugPrint(response.body);
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      _allFreeProduct = OneFreeProduct.fromJson(decodedJson);
      return _allFreeProduct;
    } else {
      var decodedJson = json.decode(response.body);
      _allFreeProduct = OneFreeProduct.fromJson(decodedJson);
      return _allFreeProduct;
    }
  }
}
