// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ForgetPasswordModel addressModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));

String addressModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());

class ForgetPasswordModel {
  ForgetPasswordModel({
    required this.number,

  });

  int? number;


  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => ForgetPasswordModel(
    number: json["address"] == null ? null : json["address"],

  );

  Map<String, dynamic> toJson() => {
    "number": number == null ? null : number,

  };
}
