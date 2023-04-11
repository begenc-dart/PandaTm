import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/ModelAddress.dart';

import '../../../LogIn/ForgetPassword/Model/ChangePassword.dart';
import '../../../LogIn/LogIn/Model/token.dart';
import 'package:http/http.dart' as http;
class AddressAdd{
  String? token;
  Future<AddressModel> createUser(String address,String welayat) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/address",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(<String, String>{
          "address": address,
          "welayat":welayat
        }));

    debugPrint(response.body);
    if (response.statusCode == 200) {

      return AddressModel.fromJson(jsonDecode(response.body));
    } else {
      return AddressModel.fromJson(jsonDecode(response.body));
    }
  }
}