
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:serpay/IpAdress.dart';

import 'package:serpay/LogIn/LogIn/Model/token.dart';


import 'package:http/http.dart' as http;

import '../../../../main.dart';
import '../../Ui/toast.dart';

class UpdateMe{

  String? token;

  Future createUser(

      String check,String pas,XFile photo,BuildContext context,String url) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.patch(
        Uri.parse(
          "${IpAddress().ipAddress}/users/update-me",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(<String, String>{
          "username": check,
          'nickname': pas,

        }));
    debugPrint(response.body);

    debugPrint(response.statusCode.toString());


    if (response.statusCode == 200) {
      UploadSellerPhoto().uploadImage(photo);
Toast().showToastDelet(context, url=="tm"?"Maglumatyňyz ýatda saklandy":"Ваша информация сохранена");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
              (Route<dynamic> route) => false
      );


      return response.body;
    } else {
      return response.body;
    }
  }


}


class UploadSellerPhoto {
  String? token;

  Future<String?> uploadImage(XFile filename, ) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            "${IpAddress().ipAddress}/users/upload-image"));
    request.headers.addAll({
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token}',
    });
    debugPrint(filename.toString());


    request.files
        .add(await http.MultipartFile.fromPath('color', filename.path));

    var res = await request.send();
    final respStr = await res.stream.bytesToString();
    debugPrint(respStr.toString());
    debugPrint(res.statusCode.toString());
    return res.reasonPhrase;
  }
}