import 'dart:convert';

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';
import 'AddressGet.dart';
import 'package:http/http.dart' as http;
class AddressGetHttp{
  String? token;
  AddressGet? addressGet;
  Future<AddressGet> addresGet() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.get(Uri.parse( "${IpAddress().ipAddress}/users/address"),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    },);

    var decodedJson = json.decode(response.body);
    addressGet= AddressGet.fromJson(decodedJson);

    return addressGet!;
  }
}