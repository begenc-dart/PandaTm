
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/passwordModel.dart';
import 'package:serpay/LogIn/LogIn/Model/CheckNumber.dart';
import 'package:serpay/Database/IdWrite.dart';
import 'package:serpay/Model/SignUp.dart';
import 'package:serpay/Database/checkSignUp.dart';
import 'package:serpay/Database/token.dart';


import 'package:http/http.dart' as http;

import '../../../main.dart';
import '../Model/NewPasswordModel.dart';
class NewPasswordPatch{

  String? token;

  Future<NewPaswordModel> createUser(

      String check,String pas, String secpas,BuildContext context) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.patch(
        Uri.parse(
          "${IpAddress().ipAddress}/users/update-my-password",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(<String, String>{
          "currentPassword": check,
          'newPassword': pas,
          'newPasswordConfirm': secpas,

        }));
    debugPrint(response.body);

    debugPrint(response.statusCode.toString());


    if (response.statusCode == 200) {

      Token().tokenDosyaYaz(json.decode(response.body)['token']);
      IdWrite().idwrite(json.decode(response.body)['data']['user']['id'].toString());
      CheckSignUp().dosyaYaz(true.toString());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
            (Route<dynamic> route) => false,
      );


      return NewPaswordModel.fromJson(jsonDecode(response.body));
    } else {
      return NewPaswordModel.fromJson(jsonDecode(response.body));
    }
  }


}