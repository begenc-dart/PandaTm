import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:serpay/Sebet/NotOrderedProduct/IsSelectModel.dart';
import 'package:serpay/Sebet/NotOrderedProduct/UpdateProductModel.dart';

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';

import 'package:http/http.dart' as http;

class UpdateProduct{
  String? token;
  Future<UpdateProductModel> createUser(String id, int check) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.patch(
        Uri.parse(
          "${IpAddress().ipAddress}/users/my-cart/$id",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(
            <String, String>{"quantity": check.toString(),}));

    debugPrint(response.body);
    if (response.statusCode == 200) {


      return UpdateProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("faild");
    }
  }
}