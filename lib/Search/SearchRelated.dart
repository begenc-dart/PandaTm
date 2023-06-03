import 'dart:convert';

import 'package:serpay/IpAdress.dart';

import '../Database/token.dart';
import 'SearchRelatedModel.dart';
import 'package:http/http.dart' as http;
class Search_related{
 late List<SearchReatedModel> searchReatedModel;
  String token="";
  Future<List<SearchReatedModel>> fetchAlbum() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });

    final response = await http
        .get(Uri.parse("${IpAddress().ipAddress}/public/products/most-searches"), headers: <String, String>{
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token}',
    });

    var decodedJson = json.decode(response.body);
    searchReatedModel = searchReatedModelFromJson(response.body);
    // debugPrint(response.body);
    return searchReatedModel;
  }
}