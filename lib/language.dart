
import 'dart:io';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';

import 'package:path_provider/path_provider.dart';

import 'package:serpay/Model/Language.dart';
String AssetLan = '';
Future<String> get LanguageFile async {
  Directory dosyaPath = await getApplicationDocumentsDirectory();
  debugPrint(dosyaPath.path);
  return dosyaPath.path;
}

Future<File> get LanguageFileCreate async {
  var dosya = await LanguageFile + "/myLanguage.text";
  return File(dosya);
}

Future<String> LanguageFileRead() async {
  try {
    var myDosya = await LanguageFileCreate;
    String dosyaIcerik = await myDosya.readAsString();
    return dosyaIcerik;
  } catch (exception) {
    return 'tm';
  }
}

Future<File> LanguageFileWrite(String yaz) async {
  var myDosya = await LanguageFileCreate;
  return myDosya.writeAsString(yaz);
}

Future<String> LanguageCode() async {
  await LanguageFileRead().then((value) {
    AssetLan = value;
  });
  return AssetLan == 'tm'
      ? "assets/language/tk.json"
      : "assets/language/ru.json";
}
class GetLanguage{
String url="";
  language()async{

   await LanguageFileRead().then((value) {
     url=value.toString();
   });

  }
}
class Language{
  String url="";
  late LanguageModel languageModel;

  language()async{

    await LanguageFileRead().then((value) {
      url = value;
    });
  }
  Future<LanguageModel> fetchAlbum(BuildContext context) async {

    await LanguageFileRead().then((value) {
      url = value;
    });
    debugPrint(url.toString());
    var giveJson = await DefaultAssetBundle.of(context).loadString(
        url == "ru" ? "asset/language/ru.json" : "asset/language/tm.json");
    var decodedJson = json.decode(giveJson);
    // debugPrint(decodedJson.toString());
    languageModel = LanguageModel.fromJson(decodedJson);

    return languageModel;
  }
}
