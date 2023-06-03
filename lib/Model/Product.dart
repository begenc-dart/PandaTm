// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.product,
  });

  Product product;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
  };
}

class Product {
  Product({
    required this.oneProduct,
    required this.recommenendations,
  });

  OneProduct oneProduct;
  List<OneProduct> recommenendations;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    oneProduct: OneProduct.fromJson(json["oneProduct"]),
    recommenendations: List<OneProduct>.from(json["recommenendations"].map((x) => OneProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "oneProduct": oneProduct.toJson(),
    "recommenendations": List<dynamic>.from(recommenendations.map((x) => x.toJson())),
  };
}

class OneProduct {
  OneProduct({
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
    required this.productColors,
    required this.productSizes,
    required this.images,
    required this.details,
    required this.brand,
    required this.seller,
    required this.productStock,
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
  int subcategoryId;
  dynamic brandId;
  int? sellerId;
  DateTime createdAt;
  DateTime updatedAt;
  List<ProductColor>? productColors;
  List<ProductSize>? productSizes;
  List<ImagesP> images;
  List<Detail>? details;
  dynamic brand;
  Seller? seller;
  List<ProductSStock>? productStock;

  factory OneProduct.fromJson(Map<String, dynamic> json) => OneProduct(
    id: json["id"],
    productId: json["product_id"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    bodyTm: json["body_tm"],
    bodyRu: json["body_ru"],
    productCode: json["product_code"],
    price: json["price"]==null?null:json["price"].toDouble(),
    priceOld: json["price_old"]==null?null:json["price_old"].toDouble(),
    priceTm: json["price_tm"]==null?null:json["price_tm"].toDouble(),
    priceTmOld:json["price_tm_old"]==null?null: json["price_tm_old"].toDouble(),
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
    productColors:json["product_colors"]==null?null: List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
    productSizes: json["product_sizes"]==null?null:List<ProductSize>.from(json["product_sizes"].map((x) => ProductSize.fromJson(x))),
    images: List<ImagesP>.from(json["images"].map((x) => ImagesP.fromJson(x))),
    details:json["details"]==null?null: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
    brand: json["brand"],
    seller: json["seller"]==null?null:Seller.fromJson(json["seller"]),
    productStock: json["product_stock"]==null?null:List<ProductSStock>.from(json["product_stock"].map((x) => ProductSStock.fromJson(x))),
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
    "product_colors": List<dynamic>.from(productColors!.map((x) => x.toJson())),
    "product_sizes": List<dynamic>.from(productSizes!.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "details": List<dynamic>.from(details!.map((x) => x.toJson())),
    "brand": brand,
    "seller": seller!.toJson(),
    "product_stock": List<dynamic>.from(productStock!.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.id,
    required this.detailId,
    required this.image,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String detailId;
  String image;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    detailId: json["detail_id"],
    image: json["image"],
    productId: json["productId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "detail_id": detailId,
    "image": image,
    "productId": productId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

class ImagesP {
  ImagesP({
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
  int? productcolorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic freeproductId;

  factory ImagesP.fromJson(Map<String, dynamic> json) => ImagesP(
    id: json["id"],
    imageId: json["image_id"],
    productId: json["productId"],
    image: json["image"],
    productcolorId: json["productcolorId"]==null?null:json["productcolorId"],
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

class ProductColor {
  ProductColor({
    required this.id,
    required this.productColorId,
    required this.productId,
    required this.colorNameTm,
    required this.colorNameRu,
    required this.createdAt,
    required this.updatedAt,
    required this.productImages,
    required this.productSizes,
  });

  int id;
  String productColorId;
  int productId;
  String colorNameTm;
  String colorNameRu;
  DateTime createdAt;
  DateTime updatedAt;
  List<ImagesP> productImages;
  List<ProductSize> productSizes;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
    id: json["id"],
    productColorId: json["product_color_id"],
    productId: json["productId"],
    colorNameTm: json["color_name_tm"],
    colorNameRu: json["color_name_ru"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    productImages: List<ImagesP>.from(json["product_images"].map((x) => ImagesP.fromJson(x))),
    productSizes: List<ProductSize>.from(json["product_sizes"].map((x) => ProductSize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_color_id": productColorId,
    "productId": productId,
    "color_name_tm": colorNameTm,
    "color_name_ru": colorNameRu,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "product_images": List<dynamic>.from(productImages.map((x) => x.toJson())),
    "product_sizes": List<dynamic>.from(productSizes.map((x) => x.toJson())),
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
    required this.productSizeStock,
  });

  int id;
  String productSizeId;
  int productId;
  int productColorId;
  String size;
  double price;
  double priceOld;
  double priceTm;
  double priceTmOld;
  dynamic priceUsd;
  dynamic priceUsdOld;
  int discount;
  DateTime createdAt;
  DateTime updatedAt;
  ProductSStock productSizeStock;

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
    id: json["id"],
    productSizeId: json["product_size_id"],
    productId: json["productId"],
    productColorId: json["productColorId"],
    size: json["size"],
    price: json["price"]==null?null:json["price"].toDouble(),
    priceOld: json["price_old"]==null?null:json["price_old"].toDouble(),
    priceTm: json["price_tm"]==null?null:json["price_tm"].toDouble(),
    priceTmOld: json["price_tm_old"]==null?null:json["price_tm_old"].toDouble(),
    priceUsd: json["price_usd"],
    priceUsdOld: json["price_usd_old"],
    discount: json["discount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    productSizeStock: ProductSStock.fromJson(json["product_size_stock"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_size_id": productSizeId,
    "productId": productId,
    "productColorId": productColorId,
    "size": size,
    "price": price,
    "price_old": priceOld,
    "price_tm": priceTm,
    "price_tm_old": priceTmOld,
    "price_usd": priceUsd,
    "price_usd_old": priceUsdOld,
    "discount": discount,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "product_size_stock": productSizeStock.toJson(),
  };
}

class ProductSStock {
  ProductSStock({
    required this.id,
    required this.productId,
    required this.productsizeId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productId;
  int? productsizeId;
  int?  quantity;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductSStock.fromJson(Map<String, dynamic> json) => ProductSStock(
    id: json["id"],
    productId: json["productId"],
    productsizeId: json["productsizeId"]==null?null:json["productsizeId"],
    quantity: json["quantity"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "productsizeId": productsizeId,
    "quantity": quantity,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
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
  String? phoneNumberExtra;
  String nameTm;
  String nameRu;
  String? image;
  String password;
  String? nickname;
  String? addressTm;
  String? addressRu;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    id: json["id"]==null?null:json["id"],
    sellerId: json["seller_id"]==null?null:json["seller_id"],
    phoneNumber: json["phone_number"],
    phoneNumberExtra: json["phone_number_extra"]==null?null:json["phone_number_extra"],
    nameTm:json["name_tm"]==null?null: json["name_tm"],
    nameRu:json["name_ru"]==null?null: json["name_ru"],
    image: json["image"]==null?null:json["image"],
    password: json["password"]==null?null:json["password"],
    nickname:json["nickname"]==null?null: json["nickname"],
    addressTm: json["address_tm"]==null?null:json["address_tm"],
    addressRu: json["address_ru"]==null?null:json["address_ru"],
    isActive:json["isActive"]==null?null: json["isActive"],
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
