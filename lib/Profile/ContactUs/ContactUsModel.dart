import 'dart:convert';

import 'package:flutter/material.dart';

import '../../IpAdress.dart';
import '../../LogIn/LogIn/Model/token.dart';
import 'package:http/http.dart' as http;

import '../../Ui/toast.dart';
import '../../main.dart';
class Contact_Us_Model{
  String? token;
  Future createUser(String name,String email,String phone,String text,BuildContext context,String url) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/public/contact-us",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(<String, String>{
          "name": name,
          "email":email,
          "phone":phone,
          "text":text,
        }));
Toast().showToastDelet(context, url=="tm"?"Siziň habaryňyz ugradyldy":"Ваше сообщение было отправлено");
    debugPrint(response.body);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
          (Route<dynamic> route) => false,
    );

      return response.body;

  }
}