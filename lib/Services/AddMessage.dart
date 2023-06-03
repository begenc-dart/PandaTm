import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../IpAdress.dart';
import '../Database/token.dart';
// import 'AddressGet.dart';
import 'package:http/http.dart' as http;

import '../Model/AddressGet.dart';
import '../Profile/Profile/Userchat.dart';
class UserChatGet{
  String? token;
  late List<UserChat> user;
  Future<List<UserChat>> addresGet() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.get(Uri.parse( "${IpAddress().ipAddress}/users/chat/admin"),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    },);
debugPrint(response.body);
    var decodedJson = json.decode(response.body);
    user= userChatFromJson(response.body).toList();

    return user.reversed.toList();
  }
}