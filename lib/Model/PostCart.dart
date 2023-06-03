// To parse this JSON data, do
//
//     final actionModel = actionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PostCart actionModelFromJson(String str) => PostCart.fromJson(json.decode(str));

String actionModelToJson(PostCart data) => json.encode(data.toJson());

class PostCart {
  PostCart({
    required this.productId,
    required this.productSizeId,
    required this.quantity,
    required this.iTake,
  });

  String? productId;
  String? productSizeId;
  double? quantity;
  String? iTake;

  factory PostCart.fromJson(Map<String, dynamic> json) => PostCart(
    productId: json["product_id"] == null ? null : json["product_id"],
    productSizeId: json["product_size_id"] == null ? null : json["product_size_id"],
    quantity: json["quantity"] == null ? null : json["quantity"].toDouble(),
    iTake: json["i_take"] == null ? null : json["i_take"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId == null ? null : productId,
    "product_size_id": productSizeId == null ? null : productSizeId,
    "quantity": quantity == null ? null : quantity,
    "i_take": iTake == null ? null : iTake,
  };
}
