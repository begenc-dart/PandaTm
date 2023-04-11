import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/model/HistoryProductModel.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/ModelAddress.dart';

import '../../../LogIn/ForgetPassword/Model/ChangePassword.dart';
import '../../../LogIn/LogIn/Model/token.dart';
import 'package:http/http.dart' as http;
class HistoryProduct{
  String? token;
  Future<HistoryProductModel> history(String productId) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/history",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(<String, String>{
          "product_id": productId
        }));

    debugPrint(response.body);
    if (response.statusCode == 200) {

      return HistoryProductModel.fromJson(jsonDecode(response.body));
    } else {
      return HistoryProductModel.fromJson(jsonDecode(response.body));
    }
  }
}