// To parse this JSON data, do
//
//     final discountModdel = discountModdelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DiscountModdel discountModdelFromJson(String str) => DiscountModdel.fromJson(json.decode(str));

String discountModdelToJson(DiscountModdel data) => json.encode(data.toJson());

class DiscountModdel {
  DiscountModdel({
    required this.discountProducts,
  });

  DiscountProducts discountProducts;

  factory DiscountModdel.fromJson(Map<String, dynamic> json) => DiscountModdel(
    discountProducts: DiscountProducts.fromJson(json["discount_products"]),
  );

  Map<String, dynamic> toJson() => {
    "discount_products": discountProducts.toJson(),
  };
}

class DiscountProducts {
  DiscountProducts({
    required this.count,
    required this.rows,
  });

  int count;
  List<Rowes> rows;

  factory DiscountProducts.fromJson(Map<String, dynamic> json) => DiscountProducts(
    count: json["count"],
    rows: List<Rowes>.from(json["rows"].map((x) => Rowes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class Rowes {
  Rowes({
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
  double price;
  double priceOld;
  double priceTm;
  double priceTmOld;
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
  int subcategoryId;
  dynamic brandId;
  int sellerId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Images> images;

  factory Rowes.fromJson(Map<String, dynamic> json) => Rowes(
    id: json["id"],
    productId: json["product_id"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    bodyTm: json["body_tm"],
    bodyRu: json["body_ru"],
    productCode: json["product_code"],
    price: json["price"]==null?0:json["price"].toDouble(),
    priceOld:json["price_old"]==null?0: json["price_old"].toDouble(),
    priceTm:json["price_tm"]==null?0: json["price_tm"].toDouble(),
    priceTmOld: json["price_tm_old"]==null?0:json["price_tm_old"].toDouble(),
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
    subcategoryId: json["subcategoryId"]==null?0:json["subcategoryId"],
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
