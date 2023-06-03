import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/Sebet/NotOrderedProduct/NotOrderedProductModel.dart';
import 'package:http/http.dart' as http;
import '../../IpAdress.dart';
import '../../Database/token.dart';

class NoteOrderProductHttp {
  NotOrderedProduct? _notOrderedProduct;
  late String _token;

  Future<NotOrderedProduct> fetchAlbum({bool isrefest = false,String sellerid=""}) async {
    await Token().tokenDosyaOku().then((value) {
      _token = value;
    });
    debugPrint(isrefest.toString());
    final response = await http.get(
        Uri.parse(isrefest == true
            ? "${IpAddress().ipAddress}/users/not-ordered?isSelected=${isrefest}&seller_id=${sellerid}"
            : "${IpAddress().ipAddress}/users/not-ordered"),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${_token}',
        });
    debugPrint(response.body.toString());
    debugPrint(_token);
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);

      return NotOrderedProduct.fromJson(decodedJson);
    } else {
      return _notOrderedProduct!;
    }
  }
}
