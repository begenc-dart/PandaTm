// To parse this JSON data, do
//
//     final isSelectdModel = isSelectdModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateProductModel isSelectdModelFromJson(String str) => UpdateProductModel.fromJson(json.decode(str));

String isSelectdModelToJson(UpdateProductModel data) => json.encode(data.toJson());

class UpdateProductModel {
  UpdateProductModel({
    required this.quantity,
  });

  String quantity;

  factory UpdateProductModel.fromJson(Map<String, dynamic> json) => UpdateProductModel(
    quantity: json["quantity"] == null ? null : json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity == null ? null : quantity,
  };
}
