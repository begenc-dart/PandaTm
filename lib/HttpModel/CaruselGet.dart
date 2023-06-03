import 'dart:convert';

import 'package:hive/hive.dart';

import '../IpAdress.dart';
import '../Model/BannerProductModel.dart';
import 'package:http/http.dart' as http;
class CaruselGet{
  var box=Hive.box("carusel");
  late BannerProdcut bannerProductModel;
  Future<BannerProdcut> fetchAlbum() async {
    final response = await http
        .get(Uri.parse("${IpAddress().ipAddress}/public/banners"));

    var decodedJson = json.decode(response.body);
    bannerProductModel = BannerProdcut.fromJson(decodedJson);
hiveMethod(bannerProductModel.banners.rows);
    return bannerProductModel;
  }
}
hiveMethod(List<Rows> a){
  var box=Hive.box("carusel");
  box.clear();
  for(int i=0;i<a.length;i++){
    box.put("carusel${i}",a[i].image);


  }

  // box.values.forEach((element) {
  //   debugPrint(element.toString());
  // });
}