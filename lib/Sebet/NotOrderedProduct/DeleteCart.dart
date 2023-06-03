import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:serpay/IpAdress.dart';

import '../../Database/token.dart';

class DeleteCart {
  String _token = "";

  deleteCart(String orderId) async {
    await Token().tokenDosyaOku().then((value) {
      _token = value;
    });
    final response = await http.post(
        Uri.parse("${IpAddress().ipAddress}/users/delete/not-ordered/${orderId}"),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${_token}',
        });
    debugPrint(response.body);
    return response.body;
  }
}
