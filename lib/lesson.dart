// To parse this JSON data, do
//
//     final dil = dilFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Dil dilFromJson(String str) => Dil.fromJson(json.decode(str));

String dilToJson(Dil data) => json.encode(data.toJson());

class Dil {
  Dil({
    required this.fridge,
    required this.flutter,
  });

  String fridge;
  String flutter;

  factory Dil.fromJson(Map<String, dynamic> json) => Dil(
    fridge: json["fridge"] == null ? null : json["fridge"],
    flutter: json["flutter"] == null ? null : json["flutter"],
  );

  Map<String, dynamic> toJson() => {
    "fridge": fridge == null ? null : fridge,
    "flutter": flutter == null ? null : flutter,
  };
}
