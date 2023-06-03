import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../IpAdress.dart';
import '../Database/token.dart';
import '../Ui/toast.dart';

class HistoryDelete {
  String? token;

  Future deleteAlbum(List id,BuildContext context,String url) async {
    List ids=id;
    debugPrint(ids.toString()+"sdfsd");
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    debugPrint(ids.toString()+"sdfsd");
    final response = await http.post(
        Uri.parse('${IpAddress().ipAddress}/users/delete/history'),
        headers: <String, String>{
          'Accept': 'application/json',
          'content-type': 'application/json',
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode( {"history_ids": ids})

        );

    debugPrint(id.toString());
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      Toast().showToastDelet(context, url=="tm"?'Harytyňyz pozuldy':"Удалить продукт");
      return response.body;
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}
