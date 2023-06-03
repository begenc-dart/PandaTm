import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serpay/Servers/Model/AllFreeProduct.dart';
import '../../IpAdress.dart';
import '../../Database/token.dart';

class AllFreeProductServer {
  String token = "";
  String ip = IpAddress().ipAddress;
  late AllFreeProduct _allFreeProduct;

  Future<AllFreeProduct> fetchAlbum() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });

    final response = await http.get(
      Uri.parse("$ip/public/free-products"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
print("fsdf"+response.body);
    if (response.statusCode == 200) {
      _allFreeProduct = allFreeProductFromJson(response.body);

      return _allFreeProduct;
    } else {
      return allFreeProductFromJson(response.body);
    }
  }
}
