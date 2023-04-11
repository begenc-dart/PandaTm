import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';
import 'ModelAddress.dart';
import 'package:http/http.dart' as http;

class PacthAddress{
  String? token;
  Future<AddressModel> createUser(String id, String addres,String welayat) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.patch(
        Uri.parse(
          "${IpAddress().ipAddress}/users/address/$id",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(
            <String, String>{"address": addres,"welayat":welayat}));

debugPrint(response.body);
    if (response.statusCode == 200) {


      return AddressModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("faild");
    }
  }
}