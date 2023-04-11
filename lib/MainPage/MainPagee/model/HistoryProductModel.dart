// To parse this JSON data, do
//
//     final historyProductModel = historyProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HistoryProductModel historyProductModelFromJson(String str) => HistoryProductModel.fromJson(json.decode(str));

String historyProductModelToJson(HistoryProductModel data) => json.encode(data.toJson());

class HistoryProductModel {
  HistoryProductModel({
    required this.historyProductModelProductId,
    required this.userId,
    required this.productId,
  });

  String? historyProductModelProductId;
  int? userId;
  int productId;

  factory HistoryProductModel.fromJson(Map<String, dynamic> json) => HistoryProductModel(
    historyProductModelProductId: json["product_id"] == null ? null : json["product_id"],
    userId: json["userId"] == null ? null : json["userId"],
    productId: json["productId"] == null ? null : json["productId"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": historyProductModelProductId == null ? null : historyProductModelProductId,
    "userId": userId == null ? null : userId,
    "productId": productId == null ? null : productId,
  };
}
