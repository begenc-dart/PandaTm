// To parse this JSON data, do
//
//     final newPaswordModel = newPaswordModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NewPaswordModel newPaswordModelFromJson(String str) => NewPaswordModel.fromJson(json.decode(str));

String newPaswordModelToJson(NewPaswordModel data) => json.encode(data.toJson());

class NewPaswordModel {
  NewPaswordModel({
    required this.currentPassword,
    required this.newPassword,
    required this.newPasswordConfirm,
  });

  String? currentPassword;
  String? newPassword;
  String? newPasswordConfirm;

  factory NewPaswordModel.fromJson(Map<String, dynamic> json) => NewPaswordModel(
    currentPassword: json["currentPassword"] == null ? null : json["currentPassword"],
    newPassword: json["newPassword"] == null ? null : json["newPassword"],
    newPasswordConfirm: json["newPasswordConfirm"] == null ? null : json["newPasswordConfirm"],
  );

  Map<String, dynamic> toJson() => {
    "currentPassword": currentPassword == null ? null : currentPassword,
    "newPassword": newPassword == null ? null : newPassword,
    "newPasswordConfirm": newPasswordConfirm == null ? null : newPasswordConfirm,
  };
}
