import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serpay/LogIn/ForgetPassword/Model/ChangePassword.dart';
import 'package:serpay/LogIn/ForgetPassword/Model/Model/PatchModel.dart';

import '../../../../IpAdress.dart';
import '../../../LogIn/Model/token.dart';
import '../../../../Profile/MyAddress/AddressModel/ModelAddress.dart';

import 'package:http/http.dart' as http;

class PacthForgetPassword{
  TextEditingController _controller=TextEditingController();
  int? bcypt;
  String? token;
  Future<ForgetPasswordModel> createUser( String phone,BuildContext context) async {

    final response = await http.patch(
        Uri.parse(
          "${IpAddress().ipAddress}/users/forgot-password",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",

        },
        body: jsonEncode(
            <String, String>{"user_phone": phone,}));

    debugPrint(response.body);
    if (response.statusCode == 200) {

      bcypt = int.parse(jsonDecode(response.body)['id']);
      showAlertDialog(context, phone);
      return ForgetPasswordModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("faild");
    }
  }

  void showAlertDialog(BuildContext context,String _phoneCon) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Giriz",
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 13),
                      child: Text(
                        "Kody:".toString(),
                        style: TextStyle(fontSize: 14),
                      )),
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 10, right: 14, left: 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        cursorColor: Color.fromRGBO(104, 109, 118, 1),
                        textAlignVertical: TextAlignVertical.bottom,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color.fromRGBO(230, 230, 230, 1)),
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  debugPrint(_controller.text);
                  debugPrint(bcypt.toString());
                  if (_controller.text == bcypt.toString()) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChangePassword(phone: _phoneCon,)));
                  } else {
                    // _showToast(incorrect.toString());

                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, left: 14, right: 14, top: 25),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromRGBO(255, 0, 0, 1),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Ugrat".toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                )),
                          )
                        ]),
                  ),
                ),
              ),
            ],
          );
        });
  }
}