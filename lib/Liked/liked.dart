import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/IpAdress.dart';
import '../../../../LogIn/LogIn/Model/token.dart';
import 'package:http/http.dart' as http;

import 'get_liked_body.dart';
import 'liked_body.dart';
class LikedProducts{
  String? token;
  //post
  Future<LikedModel> postLikedProduct(String productId) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/like",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(<String, String>{
          "product_id": productId
        }));

    debugPrint(response.body);
    if (response.statusCode == 200) {

      return LikedModel.fromJson(jsonDecode(response.body));
    } else {
      return LikedModel.fromJson(jsonDecode(response.body));
    }
  }

  // get
  Future<LikedBodyGet> getLikedProducts() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.get(Uri.parse("${IpAddress().ipAddress}/users/like?offset=0"), headers: <String, String>{
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token}',
    },);

    var decodedJson = json.decode(response.body);
    LikedBodyGet.fromJson(decodedJson);

    return LikedBodyGet.fromJson(decodedJson);
  }
  Future deleteAlbum(String id) async {

    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final  response = await http.post(
      Uri.parse('${IpAddress().ipAddress}/users/delete/like/$id'),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      },
    );
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}