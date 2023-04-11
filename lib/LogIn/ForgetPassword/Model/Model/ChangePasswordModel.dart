
import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/LogIn/ForgetPassword/Model/Model/passwordModel.dart';
import 'package:serpay/LogIn/LogIn/Model/CheckNumber.dart';
import 'package:serpay/LogIn/LogIn/Model/IdWrite.dart';
import 'package:serpay/LogIn/LogIn/Model/SignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';


import 'package:http/http.dart' as http;

import '../../../../main.dart';
class ChangePaswModel{



  Future<ChangePasModel> createUser(
       String check,String pas, String secpas,BuildContext context) async {
    final response = await http.patch(
        Uri.parse(
          "${IpAddress().ipAddress}/users/forgot-password",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, String>{
          "user_checked_phone": check,
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


      return ChangePasModel.fromJson(jsonDecode(response.body));
    } else {
      return ChangePasModel.fromJson(jsonDecode(response.body));
    }
  }


}