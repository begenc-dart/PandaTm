// To parse this JSON data, do
//
//     final allFreeProduct = allFreeProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllFreeProduct allFreeProductFromJson(String str) => AllFreeProduct.fromJson(json.decode(str));

String allFreeProductToJson(AllFreeProduct data) => json.encode(data.toJson());

class AllFreeProduct {
  AllFreeProduct({
    required this.expireTime,
    required this.data,
  });

  String? expireTime;
  List<Datum>? data;

  factory AllFreeProduct.fromJson(Map<String, dynamic> json) => AllFreeProduct(
    expireTime: json["expire_time"]==null?null:json["expire_time"],
    data:json["data"]==null?[]: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "expire_time": expireTime,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.freeproductId,
    required this.nameTm,
    required this.nameRu,
    required this.bodyTm,
    required this.bodyRu,
    required this.link,
    required this.expireDate,
    required this.goal,
    required this.max,
    required this.contestants,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  int? id;
  String? freeproductId;
  String? nameTm;
  String? nameRu;
  String? bodyTm;
  String? bodyRu;
  String? link;
  String? expireDate;
  int? goal;
  int? max;
  int? contestants;
  bool? isActive;
  DateTime createdAt;
  DateTime updatedAt;
  List<Images> images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    freeproductId: json["freeproduct_id"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    bodyTm: json["body_tm"],
    bodyRu: json["body_ru"],
    link: json["link"],
    expireDate: json["expire_date"],
    goal: json["goal"],
    max: json["max"],
    contestants: json["contestants"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "freeproduct_id": freeproductId,
    "name_tm": nameTm,
    "name_ru": nameRu,
    "body_tm": bodyTm,
    "body_ru": bodyRu,
    "link": link,
    "expire_date": expireDate,
    "goal": goal,
    "max": max,
    "contestants": contestants,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Images {
  Images({
    required this.id,
    required this.imageId,
    required this.productId,
    required this.image,
    required this.productcolorId,
    required this.createdAt,
    required this.updatedAt,
    required this.freeproductId,
  });

  int id;
  String imageId;
  dynamic productId;
  String image;
  dynamic productcolorId;
  DateTime createdAt;
  DateTime updatedAt;
  int freeproductId;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    imageId: json["image_id"],
    productId: json["productId"],
    image: json["image"],
    productcolorId: json["productcolorId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    freeproductId: json["freeproductId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_id": imageId,
    "productId": productId,
    "image": image,
    "productcolorId": productcolorId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "freeproductId": freeproductId,
  };
}
