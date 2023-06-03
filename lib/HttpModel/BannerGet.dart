import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import 'package:serpay/ChangeNotifierProvider/ChangeNotifierProv.dart';

import '../IpAdress.dart';
import '../Database/checkSignUp.dart';
import '../Database/token.dart';
import 'package:http/http.dart' as http;

import '../Model/RandomProduct.dart';

CheckSignUp checkSignUp = new CheckSignUp();
int current_page = 10;
hiveMethod(List<RandomProduct> a){
 var box=Hive.box("tasks");
 box.clear();
 if(a.length>6){
 for(int i=0;i<6;i++){
   box.put("nameTm${i}",a[i].nameTm);
   box.put("nameRu${i}",a[i].nameRu);
   box.put("bodytm${i}",a[i].bodyTm);
   box.put("bodyRu${i}",a[i].bodyRu);
   box.put("price${i}",a[i].price);
   box.put("images${i}", a[i].images.length==0?null:a[i].images[0].image);
   box.put("discount${i}", a[i].discount);
   box.put("priceold$i", a[i].priceOld);

 }}else{
   for(int i=0;i<a.length;i++){
     box.put("nameTm${i}",a[i].nameTm);
     box.put("nameRu${i}",a[i].nameRu);
     box.put("bodytm${i}",a[i].bodyTm);
     box.put("bodyRu${i}",a[i].bodyRu);
     box.put("price${i}",a[i].price);
     box.put("images${i}", a[i].images.length==0?null:a[i].images[0].image);
     box.put("discount${i}", a[i].discount);
     box.put("priceold$i", a[i].priceOld);

   }
 }

  // box.values.forEach((element) {
  //   debugPrint(element.toString());
  // });
}
class BannerGetModel {
  BuildContext context;

  BannerGetModel({required this.context});


}
