// To parse this JSON data, do
//
//     final bannerProdcut = bannerProdcutFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ModelGetMe bannerProdcutFromJson(String str) => ModelGetMe.fromJson(json.decode(str));

String bannerProdcutToJson(ModelGetMe data) => json.encode(data.toJson());

class ModelGetMe {
  ModelGetMe({
    required this.id,
    required this.userId,
    required this.username,
    required this.nickname,
    required this.userPhone,
    required this.password,
    required this.image,
    required this.lastSocketId,
    required this.createdAt,
    required this.updatedAt,
  });

  int? id;
  String? userId;
  String? username;
  String? nickname;
  String? userPhone;
  String? password;
  String? image;
  dynamic lastSocketId;
  DateTime createdAt;
  DateTime updatedAt;

  factory ModelGetMe.fromJson(Map<String, dynamic> json) => ModelGetMe(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    username: json["username"] == null ? null : json["username"],
    nickname: json["nickname"] == null ? null : json["nickname"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    password: json["password"] == null ? null : json["password"],
    image: json["image"] == null ? null : json["image"],
    lastSocketId: json["lastSocketId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "username": username == null ? null : username,
    "nickname": nickname == null ? null : nickname,
    "user_phone": userPhone == null ? null : userPhone,
    "password": password == null ? null : password,
    "image": image == null ? null : image,
    "lastSocketId": lastSocketId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
