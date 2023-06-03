import 'package:meta/meta.dart';
import 'dart:convert';

LikedModel likedModelFromJson(String str) => LikedModel.fromJson(json.decode(str));

String likedModelToJson(LikedModel data) => json.encode(data.toJson());

class LikedModel {
  LikedModel({
    @required this.productId,
  });

  String? productId;

  factory LikedModel.fromJson(Map<String, dynamic> json) => LikedModel(
    productId: json["product_id"] == null ? null : json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId == null ? null : productId,
  };
}