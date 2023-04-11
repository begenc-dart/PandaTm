import 'dart:convert';

import '../IpAdress.dart';
import 'Model/CategpriyaModel.dart';
import 'package:http/http.dart' as http;
class GetCategoriya{
  Future<List<CategoriyaModel>> caregoriyaAlbum() async {
    final response =
    await http.get(Uri.parse("${IpAddress().ipAddress}/public/categories"));

    if (response.statusCode == 200) {
      List<CategoriyaModel> a = (json.decode(response.body) as List)
          .map((e) => CategoriyaModel.fromJson(e))
          .toList();

      return a;
    } else {
      throw Exception('Failed to load album');
    }
  }

}