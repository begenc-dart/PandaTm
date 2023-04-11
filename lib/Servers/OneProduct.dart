import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/IpAdress.dart';

import '../HttpModel/BannerGet.dart';
import '../LogIn/LogIn/Model/token.dart';
import '../MainPage/Model/Product.dart';
import 'package:http/http.dart' as http;
String token="";
String checkLike="";
String ip=IpAddress().ipAddress;
late ProductModel productModel;
Future<ProductModel?> fetchAlbum(String productId) async {
  await Token().tokenDosyaOku().then((value) {
    token = value;
  });
  await checkSignUp.dosyaOku().then((value) {
    checkLike = value;
  });
  debugPrint(productId.toString());
  final response =
  await http.get(Uri.parse(
      checkLike.length==4?"$ip/users/products/${productId}":"$ip/public/products/${productId}"),
    headers: checkLike.toString().length.toInt() == 4
        ? <String, String>{
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token}',
    } : {},);
  debugPrint(response.body);
if(response.statusCode==200){
  var decodedJson = json.decode(response.body);


  productModel = ProductModel.fromJson(decodedJson);

  return productModel;}
else{
  return null;
}
}
