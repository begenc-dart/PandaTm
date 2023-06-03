// To parse this JSON data, do
//
//     final randomProduct = randomProductFromJson(jsonString);

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
part 'RandomProduct.g.dart';
List<RandomProduct> randomProductFromJson(String str) => List<RandomProduct>.from(json.decode(str).map((x) => RandomProduct.fromJson(x)));

String randomProductToJson(List<RandomProduct> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
@HiveType(typeId: 1)
class RandomProduct {
  RandomProduct({
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
    required this.images,
    required this.productSizes,
  });
  @HiveField(1)
  int id;
  @HiveField(2)
  String productId;
  @HiveField(3)
  String nameTm;
  @HiveField(4)
  String nameRu;
  @HiveField(5)
  String bodyTm;
  @HiveField(6)
  String bodyRu;
  @HiveField(7)
  String? productCode;
  @HiveField(8)
  double? price;
  @HiveField(9)
  double? priceOld;
  @HiveField(10)
  double? priceTm;
  @HiveField(11)
  double? priceTmOld;
  @HiveField(12)
  dynamic priceUsd;
  @HiveField(13)
  dynamic priceUsdOld;
  @HiveField(14)
  int? discount;
  @HiveField(15)
  bool isActive;
  @HiveField(16)
  String sex;
  @HiveField(17)
  bool isNew;
  @HiveField(18)
  bool? isAction;
  @HiveField(19)
  int rating;
  @HiveField(20)
  int ratingCount;
  @HiveField(21)
  int soldCount;
  @HiveField(22)
  int likeCount;
  @HiveField(23)
  String isNewExpire;
  @HiveField(24)
  bool isLiked;
  @HiveField(25)
  int categoryId;
  @HiveField(26)
  int subcategoryId;
  @HiveField(27)
  int? brandId;
  @HiveField(28)
  DateTime createdAt;
  @HiveField(29)
  DateTime updatedAt;
  @HiveField(30)
  List<Images> images;
  @HiveField(31)
  List<ProductSize>? productSizes;

  factory RandomProduct.fromJson(Map<String, dynamic> json) => RandomProduct(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    bodyTm: json["body_tm"] == null ? null : json["body_tm"],
    bodyRu: json["body_ru"] == null ? null : json["body_ru"],
    productCode: json["product_code"] == null ? null : json["product_code"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    priceOld: json["price_old"] == null ? null : json["price_old"].toDouble(),
    priceTm: json["price_tm"] == null ? null : json["price_tm"].toDouble(),
    priceTmOld: json["price_tm_old"] == null ? null : json["price_tm_old"].toDouble(),
    priceUsd: json["price_usd"],
    priceUsdOld: json["price_usd_old"],
    discount: json["discount"] == null ? null : json["discount"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    sex: json["sex"] == null ? null : json["sex"],
    isNew: json["isNew"] == null ? null : json["isNew"],
    isAction: json["isAction"] == null ? null : json["isAction"],
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
    updatedAt: DateTime.parse(json["updatedAt"]),
    images:  List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    productSizes:json["product_sizes"] == null ? null : List<ProductSize>.from(json["product_sizes"].map((x) => ProductSize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "body_tm": bodyTm == null ? null : bodyTm,
    "body_ru": bodyRu == null ? null : bodyRu,
    "product_code": productCode == null ? null : productCode,
    "price": price == null ? null : price,
    "price_old": priceOld == null ? null : priceOld,
    "price_tm": priceTm == null ? null : priceTm,
    "price_tm_old": priceTmOld == null ? null : priceTmOld,
    "price_usd": priceUsd,
    "price_usd_old": priceUsdOld,
    "discount": discount == null ? null : discount,
    "isActive": isActive == null ? null : isActive,
    "sex": sex == null ? null : sex,
    "isNew": isNew == null ? null : isNew,
    "isAction": isAction == null ? null : isAction,
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
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
    "product_sizes": productSizes == null ? null : List<dynamic>.from(productSizes!.map((x) => x.toJson())),
  };
}
@HiveType(typeId: 2)
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
  @HiveField(1)
  int id;
  @HiveField(2)
  int productId;
  @HiveField(3)
  String image;
  @HiveField(4)
  int? productcolorId;
  @HiveField(5)
  DateTime createdAt;
  @HiveField(6)
  DateTime updatedAt;
  @HiveField(7)
  dynamic freeproductId;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"] == null ? null : json["id"],
    productId: json["productId"] == null ? null : json["productId"],
    image: json["image"] == null ? null : json["image"],
    productcolorId: json["productcolorId"] == null ? null : json["productcolorId"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
    freeproductId: json["freeproductId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "productId": productId == null ? null : productId,
    "image": image == null ? null : image,
    "productcolorId": productcolorId == null ? null : productcolorId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "freeproductId": freeproductId,
  };
}
@HiveType(typeId: 3)
class ProductSize {
  ProductSize({
    required this.id,
    required this.productSizeId,
    required this.productId,
    required this.productColorId,
    required this.size,
    required this.price,
    required this.priceOld,
    required this.priceTm,
    required this.priceTmOld,
    required this.priceUsd,
    required this.priceUsdOld,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
  });
  @HiveField(1)
  int id;
  @HiveField(2)
  String productSizeId;
  @HiveField(3)
  int productId;
  @HiveField(4)
  int? productColorId;
  @HiveField(5)
  String? size;
  @HiveField(6)
  double? price;
  @HiveField(7)
  double? priceOld;
  @HiveField(8)
  double? priceTm;
  @HiveField(9)
  double? priceTmOld;
  @HiveField(10)
  double? priceUsd;
  @HiveField(11)
  double? priceUsdOld;
  @HiveField(12)
  int? discount;
  @HiveField(13)
  DateTime createdAt;
  @HiveField(14)
  DateTime updatedAt;

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
    id: json["id"] == null ? null : json["id"],
    productSizeId: json["product_size_id"] == null ? null : json["product_size_id"],
    productId: json["productId"] == null ? null : json["productId"],
    productColorId: json["productColorId"] == null ? null : json["productColorId"],
    size: json["size"] == null ? null : json["size"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    priceOld: json["price_old"] == null ? null : json["price_old"].toDouble(),
    priceTm: json["price_tm"] == null ? null : json["price_tm"].toDouble(),
    priceTmOld: json["price_tm_old"] == null ? null : json["price_tm_old"].toDouble(),
    priceUsd: json["price_usd"] == null ? null : json["price_usd"].toDouble(),
    priceUsdOld:json["price_usd_old"] == null ? null :  json["price_usd_old"].toDouble(),
    discount: json["discount"] == null ? null : json["discount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_size_id": productSizeId == null ? null : productSizeId,
    "productId": productId == null ? null : productId,
    "productColorId": productColorId == null ? null : productColorId,
    "size": size == null ? null : size,
    "price": price == null ? null : price,
    "price_old": priceOld == null ? null : priceOld,
    "price_tm": priceTm == null ? null : priceTm,
    "price_tm_old": priceTmOld == null ? null : priceTmOld,
    "price_usd": priceUsd == null ? null : priceUsd,
    "price_usd_old": priceUsdOld,
    "discount": discount == null ? null : discount,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
