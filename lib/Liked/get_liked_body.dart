// To parse this JSON data, do
//
//     final likedBodyGet = likedBodyGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LikedBodyGet likedBodyGetFromJson(String str) => LikedBodyGet.fromJson(json.decode(str));

String likedBodyGetToJson(LikedBodyGet data) => json.encode(data.toJson());

class LikedBodyGet {
  LikedBodyGet({
    required this.likedProduct,
  });

  List<LikedProduct>? likedProduct;

  factory LikedBodyGet.fromJson(Map<String, dynamic> json) => LikedBodyGet(
    likedProduct: json["liked_product"] == null ? null : List<LikedProduct>.from(json["liked_product"].map((x) => LikedProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "liked_product": likedProduct == null ? null : List<dynamic>.from(likedProduct!.map((x) => x.toJson())),
  };
}

class LikedProduct {
  LikedProduct({
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
    required this.categoryId,
    required this.subcategoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
    required this.likedproducts,
    required this.images,
  });

  int id;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String productCode;
  double price;
  double? priceOld;
  double? priceTm;
  double? priceTmOld;
  double priceUsd;
  double priceUsdOld;
  int? discount;
  bool isActive;
  String sex;
  bool isNew;
  dynamic isAction;
  int rating;
  int ratingCount;
  int soldCount;
  int likeCount;
  String isNewExpire;
  bool isLiked;
  int categoryId;
  int subcategoryId;
  int? brandId;
  DateTime createdAt;
  DateTime updatedAt;
  Likedproducts likedproducts;
  List<Images> images;

  factory LikedProduct.fromJson(Map<String, dynamic> json) => LikedProduct(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    bodyTm: json["body_tm"] == null ? null : json["body_tm"],
    bodyRu: json["body_ru"] == null ? null : json["body_ru"],
    productCode:json["price"] == null ? "" : json["product_code"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    priceOld:json["price_old"] == null ? 0 : json["price_old"].toDouble(),
    priceTm: json["price_tm"] == null ? 0 : json["price_tm"].toDouble(),
    priceTmOld: json["price_tm_old"] == null ? 0 : json["price_tm_old"],
    priceUsd: json["price_usd"],
    priceUsdOld: json["price_usd_old"],
    discount: json["discount"] == null ? null : json["discount"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    sex: json["sex"] == null ? null : json["sex"],
    isNew: json["isNew"] == null ? null : json["isNew"],
    isAction: json["isAction"],
    rating: json["rating"] == null ? null : json["rating"],
    ratingCount: json["rating_count"] == null ? null : json["rating_count"],
    soldCount: json["sold_count"] == null ? null : json["sold_count"],
    likeCount: json["likeCount"] == null ? null : json["likeCount"],
    isNewExpire: json["is_new_expire"] == null ? null : json["is_new_expire"],
    isLiked: json["isLiked"] == null ? null : json["isLiked"],
    categoryId: json["categoryId"] == null ? null : json["categoryId"],
    subcategoryId: json["subcategoryId"] == null ? null : json["subcategoryId"],
    brandId: json["brandId"] == null ? null : json["brandId"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
    likedproducts:  Likedproducts.fromJson(json["Likedproducts"]),
    images:  List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "body_tm": bodyTm == null ? null : bodyTm,
    "body_ru": bodyRu == null ? null : bodyRu,
    "product_code": productCode,
    "price": price == null ? null : price,
    "price_old": priceOld,
    "price_tm": priceTm == null ? null : priceTm,
    "price_tm_old": priceTmOld,
    "price_usd": priceUsd,
    "price_usd_old": priceUsdOld,
    "discount": discount == null ? null : discount,
    "isActive": isActive == null ? null : isActive,
    "sex": sex == null ? null : sex,
    "isNew": isNew == null ? null : isNew,
    "isAction": isAction,
    "rating": rating == null ? null : rating,
    "rating_count": ratingCount == null ? null : ratingCount,
    "sold_count": soldCount == null ? null : soldCount,
    "likeCount": likeCount == null ? null : likeCount,
    "is_new_expire": isNewExpire == null ? null : isNewExpire,
    "isLiked": isLiked == null ? null : isLiked,
    "categoryId": categoryId == null ? null : categoryId,
    "subcategoryId": subcategoryId == null ? null : subcategoryId,
    "brandId": brandId == null ? null : brandId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "Likedproducts": likedproducts == null ? null : likedproducts.toJson(),
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Images {
  Images({
    required this.id,
    required this.productId,
    required this.image,
    required this.productcolorId,
    required this.createdAt,
    required this.updatedAt,
    required this.freeproductId,
  });

  int id;
  int productId;
  String image;
  dynamic productcolorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic freeproductId;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"] == null ? null : json["id"],
    productId: json["productId"] == null ? null : json["productId"],
    image: json["image"] == null ? null : json["image"],
    productcolorId: json["productcolorId"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    freeproductId: json["freeproductId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "productId": productId == null ? null : productId,
    "image": image == null ? null : image,
    "productcolorId": productcolorId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "freeproductId": freeproductId,
  };
}

class Likedproducts {
  Likedproducts({
    required this.productId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int productId;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Likedproducts.fromJson(Map<String, dynamic> json) => Likedproducts(
    productId: json["productId"] == null ? null : json["productId"],
    userId: json["userId"] == null ? null : json["userId"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId == null ? null : productId,
    "userId": userId == null ? null : userId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
