// To parse this JSON data, do
//
//     final oneFreeProduct = oneFreeProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OneFreeProduct oneFreeProductFromJson(String str) => OneFreeProduct.fromJson(json.decode(str));

String oneFreeProductToJson(OneFreeProduct data) => json.encode(data.toJson());

class OneFreeProduct {
  OneFreeProduct({
    required this.freeProduct,
    required this.top5,
  });

  FreeProduct freeProduct;
  List<Top5> top5;

  factory OneFreeProduct.fromJson(Map<String, dynamic> json) => OneFreeProduct(
    freeProduct: FreeProduct.fromJson(json["free_product"]),
    top5: List<Top5>.from(json["top5"].map((x) => Top5.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "free_product": freeProduct.toJson(),
    "top5": List<dynamic>.from(top5.map((x) => x.toJson())),
  };
}

class FreeProduct {
  FreeProduct({
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

  int id;
  String freeproductId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  dynamic link;
  String expireDate;
  int goal;
  int max;
  int contestants;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  List<OneFreeProductImage> images;

  factory FreeProduct.fromJson(Map<String, dynamic> json) => FreeProduct(
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
    images: List<OneFreeProductImage>.from(json["images"].map((x) => OneFreeProductImage.fromJson(x))),
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

class OneFreeProductImage {
  OneFreeProductImage({
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

  factory OneFreeProductImage.fromJson(Map<String, dynamic> json) => OneFreeProductImage(
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

class Top5 {
  Top5({
    required this.count,
    required this.nickname,
    required this.image,
  });

  int count;
  String nickname;
  String image;

  factory Top5.fromJson(Map<String, dynamic> json) => Top5(
    count: json["count"],
    nickname: json["nickname"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "nickname": nickname,
    "image": image,
  };
}
