import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Profile/Order/OrderDetails.dart';

import '../../LogIn/LogIn/Model/token.dart';
import 'package:http/http.dart' as http;

class OrderModels {
  String token = "";
  late OrderDetails orderDetails;

  Future<OrderDetails> canceled(String a) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    debugPrint(token);
    debugPrint(a);
    final response = await http.get(Uri.parse(a != "1"
        ? "${IpAddress().ipAddress}/users/my-orders?status=$a"
        : "${IpAddress().ipAddress}/users/my-orders"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },);


    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      orderDetails = OrderDetails.fromJson(decodedJson);

      return orderDetails;
    } else {
      throw Exception('Failed to load album');
    }
  }
}