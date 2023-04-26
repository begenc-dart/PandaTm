import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:serpay/Profile/GetMe/ModelGetMe.dart';
import 'package:serpay/Ui/toast.dart';
import 'package:share/share.dart';

import '../../IpAdress.dart';
import '../../LogIn/LogIn/Model/checkSignUp.dart';
import '../../LogIn/LogIn/Model/token.dart';
import '../../MainPage/Model/Action.dart';

class PostGetMe {
  String checkLike = "";
  String? token;
  String ip = IpAddress().ipAddress;
  late ModelGetMe modelGetMe;
  CheckSignUp checkSignUp = new CheckSignUp();

  Future<ModelGetMe> fetchAlbum() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    final response = await http
        .get(Uri.parse("${ip}/users/get-me"), headers: <String, String>{
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token}',
    });

    var decodedJson = json.decode(response.body);
    modelGetMe = ModelGetMe.fromJson(decodedJson);
    debugPrint(response.body);
    return modelGetMe;
  }
}
class FreeProductOwn {
  String checkLike = "";
  String? token;
  String ip = IpAddress().ipAddress;
  late ModelGetMe modelGetMe;
  CheckSignUp checkSignUp = new CheckSignUp();

  Future fetchAlbum(String freeProductId,BuildContext context) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    final response = await http.post(Uri.parse("${ip}/users/competition/add"),
        headers: <String, String>{
          'Authorization': 'Bearer ${token}',
        },
        body: {
          "freeproduct_id": freeProductId,

        });
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    // debugPrint(username);
    // createDynamicLink(response.body);
    if(response.statusCode==201){
      Share.share(json.decode(response.body)["link"]);
      return response.body;
    }
    else {
      Toast().showToastDelet(context, "Siz eyyam gatnasdynyz");
      Navigator.pop(context);
      return response.body;
    }
  }
}
class FreeProductPost {
  String checkLike = "";
  String? token;
  String ip = IpAddress().ipAddress;
  late ModelGetMe modelGetMe;
  CheckSignUp checkSignUp = new CheckSignUp();

  Future fetchAlbum(String freeProductId,String username,BuildContext context) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    final response = await http.post(Uri.parse("${ip}/users/competition/add-one"),
        headers: <String, String>{
          'Authorization': 'Bearer ${token}',
        },
        body: {
          "freeproduct_id": freeProductId,
          "username":username
        });
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
debugPrint(username);
    // createDynamicLink(response.body);
    if(response.statusCode==201){
      Share.share(json.decode(response.body)["sharing_user"]["link"]);
      return response.body;
    }
    else if(response.statusCode==402){
      Toast().showToastDelet(context, "Siz eyyam gatnasdynyz");
      Navigator.pop(context);
      Navigator.pop(context);
      return response.body;
    }
  }
}
class FreePro {
  String checkLike = "";
  String? token;
  String ip = IpAddress().ipAddress;
  late ModelGetMe modelGetMe;
  CheckSignUp checkSignUp = new CheckSignUp();

  Future fetchAlbum(String freeProductId,BuildContext context) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    debugPrint(freeProductId);
    final response = await http.post(Uri.parse("${ip}/users/competition/add-one/from-link"),
        headers: <String, String>{
          'Authorization': 'Bearer ${token}',
        },
        body: {
          "sharinguser_id":freeProductId
        });

    debugPrint(response.statusCode.toString());

    // createDynamicLink(response.body);
    if(response.statusCode==200){
      Navigator.pop(context);
      // Share.share(json.decode(response.body)["sharing_user"]["link"]);
      return response.body;
    }
    else if(response.statusCode==402){
      Toast().showToastDelet(context, "Siz eyyam gatnasdynyz");
      Navigator.pop(context);

      return response.body;
    }
  }
}
//
//
// initDynamicLinks() async {
//   await Future.delayed(Duration(seconds: 3));
//   var data = await FirebaseDynamicLinks.instance.getInitialLink();
//   var deepLink = data?.link;
//   final queryParams = deepLink!.queryParameters;
//   if (queryParams.length > 0) {
//     var userName = queryParams['userId'];
//   }
//   FirebaseDynamicLinks.instance.onLink;
// }
// Future createDynamicLink(String link) async {
// initDynamicLinks();
//   var parameters = DynamicLinkParameters(
//     uriPrefix: 'https://sebet.page.link',
//     link: Uri.parse('https://test/welcome?userId=1'),
//     androidParameters: AndroidParameters(
//       packageName: "com.example.serpay",
//     ),
//     iosParameters: IOSParameters(
//       bundleId: "com.exmple.test",
//       appStoreId: '1498909115',
//     ),
//   );
//   // var dynamicUrl = await parameters.();
//   // var shortLink = await parameters.buildShortLink();
//   // var shortUrl = shortLink.shortUrl;
//
//   return
// }
