import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:serpay/Sebet/NotOrderedProduct/IsSelectModel.dart';

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';

import 'package:http/http.dart' as http;

import '../../Ui/toast.dart';
import '../../main.dart';

class AddOrder {
  String? token;

  Future<IsSelectdModel> createUser(
      String address, String payment_type, String deliver_time,BuildContext context,String phone,String note,String name,String sellerId,String url) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/my-orders/add",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },

        body: jsonEncode(<String, String>{
          "address": address,
          "name":name,
          "payment_type":payment_type,
          "delivery_time":deliver_time,
          "user_phone":phone,
          "note":note,
          "seller_id":sellerId
        }));
    debugPrint(sellerId.toString());
    debugPrint(response.body);
        Fluttertoast.showToast(

            msg: url=="tm"?"Sargydyňyz kabul edildi":"Ваш заказ принят",

            // toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    if (response.statusCode == 200) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyApp()),
              (Route<dynamic> route) => false
      );

      return IsSelectdModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("faild");
    }
  }
}
