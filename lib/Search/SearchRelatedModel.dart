// To parse this JSON data, do
//
//     final searchReatedModel = searchReatedModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SearchReatedModel> searchReatedModelFromJson(String str) => List<SearchReatedModel>.from(json.decode(str).map((x) => SearchReatedModel.fromJson(x)));

String searchReatedModelToJson(List<SearchReatedModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchReatedModel {
  SearchReatedModel({
    required this.id,
    required this.name,
    required this.count,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int count;
  DateTime createdAt;
  DateTime updatedAt;

  factory SearchReatedModel.fromJson(Map<String, dynamic> json) => SearchReatedModel(
    id: json["id"],
    name: json["name"],
    count: json["count"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "count": count,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
