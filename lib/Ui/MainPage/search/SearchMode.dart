// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    required this.products,
    required this.subcategories,
    required this.seller,
  });

  Products products;
  Subcategories subcategories;
  List<Seller> seller;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    products: Products.fromJson(json["products"]),
    subcategories: Subcategories.fromJson(json["subcategories"]),
    seller: List<Seller>.from(json["seller"].map((x) => Seller.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": products.toJson(),
    "subcategories": subcategories.toJson(),
    "seller": List<dynamic>.from(seller.map((x) => x.toJson())),
  };
}

class Products {
  Products({
    required this.count,
    required this.rows,
  });

  int count;
  List<Data> rows;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    count: json["count"],
    rows: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "data": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    productId: json["product_id"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    bodyTm: json["body_tm"],
    bodyRu: json["body_ru"],
    productCode: json["product_code"],
    price: json["price"]==null?null:json["price"].toDouble(),
    priceOld: json["price_old"]==null?null: json["price_old"].toDouble(),
    priceTm:  json["price_tm"]==null?null:json["price_tm"].toDouble(),
    priceTmOld: json["price_tm_old"]==null?null: json["price_tm_old"],
    priceUsd: json["price"]==null?null: json["price_usd"],
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

class Seller {
  Seller({
    required this.id,
    required this.sellerId,
    required this.phoneNumber,
    required this.phoneNumberExtra,
    required this.nameTm,
    required this.nameRu,
    required this.image,
    required this.password,
    required this.nickname,
    required this.addressTm,
    required this.addressRu,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String sellerId;
  String phoneNumber;
  dynamic phoneNumberExtra;
  String nameTm;
  String nameRu;
  String image;
  String password;
  dynamic nickname;
  String addressTm;
  String addressRu;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    id: json["id"],
    sellerId: json["seller_id"],
    phoneNumber: json["phone_number"],
    phoneNumberExtra: json["phone_number_extra"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    image: json["image"],
    password: json["password"],
    nickname: json["nickname"],
    addressTm: json["address_tm"],
    addressRu: json["address_ru"],
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seller_id": sellerId,
    "phone_number": phoneNumber,
    "phone_number_extra": phoneNumberExtra,
    "name_tm": nameTm,
    "name_ru": nameRu,
    "image": image,
    "password": password,
    "nickname": nickname,
    "address_tm": addressTm,
    "address_ru": addressRu,
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class Subcategories {
  Subcategories({
    required this.count,
    required this.rows,
  });

  int count;
  List<SubcategoriesRow> rows;

  factory Subcategories.fromJson(Map<String, dynamic> json) => Subcategories(
    count: json["count"],
    rows: List<SubcategoriesRow>.from(json["rows"].map((x) => SubcategoriesRow.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class SubcategoriesRow {
  SubcategoriesRow({
    required this.id,
    required this.subcategoryId,
    required this.nameTm,
    required this.nameRu,
    required this.image,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String subcategoryId;
  String nameTm;
  String nameRu;
  String image;
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  factory SubcategoriesRow.fromJson(Map<String, dynamic> json) => SubcategoriesRow(
    id: json["id"],
    subcategoryId: json["subcategory_id"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    image: json["image"],
    categoryId: json["categoryId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subcategory_id": subcategoryId,
    "name_tm": nameTm,
    "name_ru": nameRu,
    "image": image,
    "categoryId": categoryId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
