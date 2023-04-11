// To parse this JSON data, do
//
//     final isSelectdModel = isSelectdModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

IsSelectdModel isSelectdModelFromJson(String str) => IsSelectdModel.fromJson(json.decode(str));

String isSelectdModelToJson(IsSelectdModel data) => json.encode(data.toJson());

class IsSelectdModel {
  IsSelectdModel({
    required this.isSelected,
  });

  String? isSelected;

  factory IsSelectdModel.fromJson(Map<String, dynamic> json) => IsSelectdModel(
    isSelected: json["isSelected"] == null ? null : json["isSelected"],
  );

  Map<String, dynamic> toJson() => {
    "isSelected": isSelected == null ? null : isSelected,
  };
}
