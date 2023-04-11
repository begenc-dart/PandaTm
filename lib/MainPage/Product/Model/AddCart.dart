import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:serpay/MainPage/Product/Model/PostCart.dart';
import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';
import 'package:http/http.dart' as http;
class AddCart {
  String? token;
  late int a;
  Future<PostCart> createUser(
      BuildContext context,
      String id,
      String product_size,
      String quantity,
      String check,
      int a,
      String orderProduct) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    debugPrint(a.toString());
    final response = a == 0
        ? await http.post(
            Uri.parse(
              "${IpAddress().ipAddress}/users/to-my-cart",
            ),
            headers: <String, String>{
              "Content-Type": "application/json",
              'Authorization': 'Bearer ${token}',
            },
            body: jsonEncode(<String, String>{
              "product_id": id,
              "product_size_id": product_size,
              "quantity": quantity,
              "i_take": check
            }))
        : await http.patch(
            Uri.parse(
              "${IpAddress().ipAddress}/users/my-cart/${orderProduct}",
            ),
            headers: <String, String>{
              "Content-Type": "application/json",
              'Authorization': 'Bearer ${token}',
            },
            body: jsonEncode(<String, String>{
              "product_id": id,
              "product_size_id": product_size,
              "quantity": quantity,
              "i_take": check,
            }));
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return PostCart.fromJson(jsonDecode(response.body));
    } else {
      return PostCart.fromJson(jsonDecode(response.body));
    }
  }
}
