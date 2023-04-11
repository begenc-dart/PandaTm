import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:serpay/Sebet/NotOrderedProduct/IsSelectModel.dart';

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';

import 'package:http/http.dart' as http;

class IsSelected{
  String? token;
  Future<IsSelectdModel> createUser(String id, String check) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response =
    await http.patch(
        Uri.parse(
          "${IpAddress().ipAddress}/users/my-cart/select/$id",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(
            <String, String>{"isSelected": check,}));

    debugPrint(response.body);
    if (response.statusCode == 200) {


      return IsSelectdModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("faild");
    }
  }
}