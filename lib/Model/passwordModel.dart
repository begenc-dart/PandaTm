// To parse this JSON data, do
//
//     final changePasModel = changePasModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChangePasModel changePasModelFromJson(String str) => ChangePasModel.fromJson(json.decode(str));

String changePasModelToJson(ChangePasModel data) => json.encode(data.toJson());

class ChangePasModel {
  ChangePasModel({
    required this.userCheckedPhone,
    required this.password,
    required this.passwordConfirm,
  });

  String? userCheckedPhone;
  String? password;
  String? passwordConfirm;

  factory ChangePasModel.fromJson(Map<String, dynamic> json) => ChangePasModel(
    userCheckedPhone: json["user_checked_phone"] == null ? null : json["user_checked_phone"],
    password: json["password"] == null ? null : json["password"],
    passwordConfirm: json["passwordConfirm"] == null ? null : json["passwordConfirm"],
  );

  Map<String, dynamic> toJson() => {
    "user_checked_phone": userCheckedPhone == null ? null : userCheckedPhone,
    "password": password == null ? null : password,
    "passwordConfirm": passwordConfirm == null ? null : passwordConfirm,
  };
}
