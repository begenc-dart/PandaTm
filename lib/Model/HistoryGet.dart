// To parse this JSON data, do
//
//     final historyGet = historyGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HistoryGet> historyGetFromJson(String str) => List<HistoryGet>.from(json.decode(str).map((x) => HistoryGet.fromJson(x)));

String historyGetToJson(List<HistoryGet> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryGet {
  HistoryGet({
    required this.id,
    required this.historyId,
    required this.userId,
    required this.productId,
    required this.isSelected,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  int id;
  String historyId;
  int userId;
  int productId;
  bool isSelected;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  factory HistoryGet.fromJson(Map<String, dynamic> json) => HistoryGet(
    id: json["id"],
    historyId: json["history_id"],
    userId: json["userId"],
    productId: json["productId"],
    isSelected: json["isSelected"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "history_id": historyId,
    "userId": userId,
    "productId": productId,
    "isSelected": isSelected,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.id,
    required this.productId,
    required this.nameTm,
    required this.nameRu,
    required this.bodyTm,
    required this.bodyRu,
    required this.productCode,
    required this.price,
    required this.priceOld,
    required this.priceTm,
    required this.priceTmOld,
    required this.priceUsd,
    required this.priceUsdOld,
    required this.discount,
    required this.isActive,
    required this.sex,
    required this.isNew,
    required this.isAction,
    required this.rating,
    required this.ratingCount,
    required this.soldCount,
    required this.likeCount,
    required this.isNewExpire,
    required this.isLiked,
    required this.note,
    required this.categoryId,
    required this.subcategoryId,
    required this.brandId,
    required this.sellerId,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  int id;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String productCode;
  double? price;
  double? priceOld;
  double? priceTm;
  double? priceTmOld;
  dynamic priceUsd;
  dynamic priceUsdOld;
  int discount;
  bool isActive;
  String sex;
  bool isNew;
  bool isAction;
  int rating;
  int ratingCount;
  int soldCount;
  int likeCount;
  String isNewExpire;
  bool isLiked;
  dynamic note;
  int categoryId;
  dynamic subcategoryId;
  dynamic brandId;
  dynamic sellerId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Images> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productId: json["product_id"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    bodyTm: json["body_tm"],
    bodyRu: json["body_ru"],
    productCode: json["product_code"],
    price: json["price"]==null?null:json["price"].toDouble(),
    priceOld:json["price_old"]==null?null: json["price_old"].toDouble(),
    priceTm:json["price_tm"]==null?null: json["price_tm"].toDouble(),
    priceTmOld: json["price_tm_old"]==null?null:json["price_tm_old"].toDouble(),
    priceUsd: json["price_usd"],
    priceUsdOld: json["price_usd_old"],
    discount: json["discount"],
    isActive: json["isActive"],
    sex: json["sex"],
    isNew: json["isNew"],
    isAction: json["isAction"],
    rating: json["rating"],
    ratingCount: json["rating_count"],
    soldCount: json["sold_count"],
    likeCount: json["likeCount"],
    isNewExpire: json["is_new_expire"],
    isLiked: json["isLiked"],
    note: json["note"],
    categoryId: json["categoryId"],
    subcategoryId: json["subcategoryId"],
    brandId: json["brandId"],
    sellerId: json["sellerId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "name_tm": nameTm,
    "name_ru": nameRu,
    "body_tm": bodyTm,
    "body_ru": bodyRu,
    "product_code": productCode,
    "price": price,
    "price_old": priceOld,
    "price_tm": priceTm,
    "price_tm_old": priceTmOld,
    "price_usd": priceUsd,
    "price_usd_old": priceUsdOld,
    "discount": discount,
    "isActive": isActive,
    "sex": sex,
    "isNew": isNew,
    "isAction": isAction,
    "rating": rating,
    "rating_count": ratingCount,
    "sold_count": soldCount,
    "likeCount": likeCount,
    "is_new_expire": isNewExpire,
    "isLiked": isLiked,
    "note": note,
    "categoryId": categoryId,
    "subcategoryId": subcategoryId,
    "brandId": brandId,
    "sellerId": sellerId,
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
  int productId;
  String image;
  int productcolorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic freeproductId;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    imageId: json["image_id"],
    productId: json["productId"],
    image: json["image"],
    productcolorId: json["productcolorId"]==null?0:json["productcolorId"],
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
