// To parse this JSON data, do
//
//     final userChat = userChatFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserChat> userChatFromJson(String str) => List<UserChat>.from(json.decode(str).map((x) => UserChat.fromJson(x)));

String userChatToJson(List<UserChat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserChat {
  UserChat({
    required this.text,
    required this.id,
    required this.userId1,
    required this.userId2,
    required this.isYou,
    required this.createdAt,
    required this.updatedAt,
  });

  String text;
  int id;
  String userId1;
  String userId2;
  bool isYou;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserChat.fromJson(Map<String, dynamic> json) => UserChat(
    text: json["text"],
    id: json["id"],
    userId1: json["user_id1"],
    userId2: json["user_id2"],
    isYou: json["isYou"],
    createdAt: json["createdAt"]==null?null:DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"]==null?null:DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "id": id,
    "user_id1": userId1,
    "user_id2": userId2,
    "isYou": isYou,
    "createdAt": createdAt!.toIso8601String(),
    "updatedAt": updatedAt!.toIso8601String(),
  };
}
