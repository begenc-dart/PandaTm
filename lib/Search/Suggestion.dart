import 'dart:convert';

import 'package:serpay/IpAdress.dart';

import 'package:meta/meta.dart';
import 'dart:convert';
import '../Database/token.dart';
import 'SearchRelatedModel.dart';
import 'package:http/http.dart' as http;
class SuggestionGet{
  // late List<SearchReatedModel> searchReatedModel;
  String token="";
  Future<List<String>> fetchAlbum(String sug) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });

    final response = await http
        .get(Uri.parse("${IpAddress().ipAddress}/public/products/search-lite?keyword=${sug}"), headers: <String, String>{
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token}',
    });


    // debugPrint(response.body);
    return suggestionFromJson(response.body);
  }
}

List<String> suggestionFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String suggestionToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
