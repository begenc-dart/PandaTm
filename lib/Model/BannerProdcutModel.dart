// To parse this JSON data, do
//
//     final bannerProductProduct = bannerProductProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BannerProductProduct bannerProductProductFromJson(String str) =>
    BannerProductProduct.fromJson(json.decode(str));

String bannerProductProductToJson(BannerProductProduct data) =>
    json.encode(data.toJson());

class BannerProductProduct {
  BannerProductProduct({
    required this.products,
    required this.count,
  });

  List<Product>? products;
  int count;

  factory BannerProductProduct.fromJson(Map<String, dynamic> json) =>
      BannerProductProduct(
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? null
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "count": count == null ? null : count,
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
    required this.isDiscount,
    required this.isNew,
    required this.isAction,
    required this.rating,
    required this.ratingCount,
    required this.soldCount,
    required this.isNewExpire,
    required this.categoryId,
    required this.subcategoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
    required this.productSizes,
  });

  int id;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String? productCode;
  int? price;
  int? priceOld;
  int? priceTm;
  int? priceTmOld;
  dynamic priceUsd;
  dynamic priceUsdOld;
  int? discount;
  bool isActive;
  bool? isDiscount;
  bool isNew;
  bool? isAction;
  int rating;
  int ratingCount;
  int soldCount;
  String isNewExpire;
  int categoryId;
  int subcategoryId;
  int brandId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Images>? images;
  List<ProductSize>? productSizes;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        nameTm: json["name_tm"] == null ? null : json["name_tm"],
        nameRu: json["name_ru"] == null ? null : json["name_ru"],
        bodyTm: json["body_tm"] == null ? null : json["body_tm"],
        bodyRu: json["body_ru"] == null ? null : json["body_ru"],
        productCode: json["product_code"] == null ? null : json["product_code"],
        price: json["price"] == null ? null : json["price"],
        priceOld: json["price_old"] == null ? null : json["price_old"],
        priceTm: json["price_tm"] == null ? null : json["price_tm"],
        priceTmOld: json["price_tm_old"] == null ? null : json["price_tm_old"],
        priceUsd: json["price_usd"],
        priceUsdOld: json["price_usd_old"],
        discount: json["discount"] == null ? null : json["discount"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        isDiscount: json["isDiscount"] == null ? null : json["isDiscount"],
        isNew: json["isNew"] == null ? null : json["isNew"],
        isAction: json["isAction"] == null ? null : json["isAction"],
        rating: json["rating"] == null ? null : json["rating"],
        ratingCount: json["rating_count"] == null ? null : json["rating_count"],
        soldCount: json["sold_count"] == null ? null : json["sold_count"],
        isNewExpire:
            json["is_new_expire"] == null ? null : json["is_new_expire"],
        categoryId: json["categoryId"] == null ? null : json["categoryId"],
        subcategoryId:
            json["subcategoryId"] == null ? null : json["subcategoryId"],
        brandId: json["brandId"] == null ? null : json["brandId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        images: json["images"] == null
            ? null
            : List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
        productSizes: json["product_sizes"] == null
            ? null
            : List<ProductSize>.from(
                json["product_sizes"].map((x) => ProductSize.fromJson(x))),
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
        "isDiscount": isDiscount == null ? null : isDiscount,
        "isNew": isNew == null ? null : isNew,
        "isAction": isAction == null ? null : isAction,
        "rating": rating == null ? null : rating,
        "rating_count": ratingCount == null ? null : ratingCount,
        "sold_count": soldCount == null ? null : soldCount,
        "is_new_expire": isNewExpire == null ? null : isNewExpire,
        "categoryId": categoryId == null ? null : categoryId,
        "subcategoryId": subcategoryId == null ? null : subcategoryId,
        "brandId": brandId == null ? null : brandId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "product_sizes": productSizes == null
            ? null
            : List<dynamic>.from(productSizes!.map((x) => x.toJson())),
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
  int? productcolorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic freeproductId;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"] == null ? null : json["id"],
        productId: json["productId"] == null ? null : json["productId"],
        image: json["image"] == null ? null : json["image"],
        productcolorId:
            json["productcolorId"] == null ? null : json["productcolorId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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

  int id;
  String productSizeId;
  int productId;
  int? productColorId;
  String size;
  double? price;
  int? priceOld;
  int? priceTm;
  int? priceTmOld;
  int? priceUsd;
  int? priceUsdOld;
  int? discount;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
        id: json["id"] == null ? null : json["id"],
        productSizeId:
            json["product_size_id"] == null ? null : json["product_size_id"],
        productId: json["productId"] == null ? null : json["productId"],
        productColorId:
            json["productColorId"] == null ? null : json["productColorId"],
        size: json["size"] == null ? null : json["size"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        priceOld: json["price_old"] == null ? null : json["price_old"],
        priceTm: json["price_tm"] == null ? null : json["price_tm"],
        priceTmOld: json["price_tm_old"] == null ? null : json["price_tm_old"],
        priceUsd: json["price_usd"] == null ? null : json["price_usd"],
        priceUsdOld:
            json["price_usd_old"] == null ? null : json["price_usd_old"],
        discount: json["discount"] == null ? null : json["discount"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
        "price_usd_old": priceUsdOld == null ? null : priceUsdOld,
        "discount": discount == null ? null : discount,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
