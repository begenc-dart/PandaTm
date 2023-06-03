import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:serpay/Sebet/NotOrderedProduct/IsSelectModel.dart';

import '../../../IpAdress.dart';
import '../../Database/token.dart';

import 'package:http/http.dart' as http;

import '../../Ui/toast.dart';
import '../../main.dart';
import '../OnlinePay.dart';

class AddOrder {
  String? token;

  Future<IsSelectdModel> createUser(
      String address, String payment_type, String deliver_time,BuildContext context,String phone,String note,String name,String sellerId,String url,double pay) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/my-orders/add",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },

        body: jsonEncode(<String, String>{
          "address": address,
          "name":name,
          "payment_type":payment_type,
          "delivery_time":deliver_time,
          "user_phone":phone,
          "note":note,
          "seller_id":sellerId
        }));
    debugPrint(sellerId.toString());
    debugPrint(response.body);
//         Fluttertoast.showToast(
//
//             msg: url=="tm"?"Sargydyňyz kabul edildi":"Ваш заказ принят",
// // toastLength: Toast().,
//             // toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );

    if (response.statusCode == 200) {
    payment_type!="Online"? {
      {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                    (Route<dynamic> route) => false)
              },
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.5,left:  MediaQuery.of(context).size.height*0.1,right: MediaQuery.of(context).size.height*0.1),
    behavior: SnackBarBehavior.floating,
    elevation: 0,
    backgroundColor: Colors.transparent,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Image.asset("asset/Setting/1.gif",width: 150,height: 150,),
    Container(child: Center(child: Text( "Sargydyňyz kabul edildi",style: TextStyle(color: Colors.white),)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),margin: EdgeInsets.only(left: 10,right: 10),width: MediaQuery.of(context).size.width*0.6,height: 30,),
    ],
    ),
    ))
            }
          : Navigator.push(context, MaterialPageRoute(builder: (context)=>OnlinePay(id: jsonDecode(response.body)["data"]["orders_array"][0]["order_id"], payment: pay,)));

      return IsSelectdModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("faild");
    }
  }
}
