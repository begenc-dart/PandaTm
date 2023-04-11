// To parse this JSON data, do
//
//     final modelLogIn = modelLogInFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelLogIn modelLogInFromJson(String str) => ModelLogIn.fromJson(json.decode(str));

String modelLogInToJson(ModelLogIn data) => json.encode(data.toJson());

class ModelLogIn {
  ModelLogIn({
    required this.userPhone,
    required this.password,
  });

  String? userPhone;
  String? password;

  factory ModelLogIn.fromJson(Map<String, dynamic> json) => ModelLogIn(
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "user_phone": userPhone == null ? null : userPhone,
    "password": password == null ? null : password,
  };
}
