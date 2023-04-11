// To parse this JSON data, do
//
//     final notOrderedProduct = notOrderedProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NotOrderedProduct notOrderedProductFromJson(String str) => NotOrderedProduct.fromJson(json.decode(str));

String notOrderedProductToJson(NotOrderedProduct data) => json.encode(data.toJson());

class NotOrderedProduct {
  NotOrderedProduct({
    required this.notOrderedProducts,
  });

  List<NotOrderedProductElement> notOrderedProducts;

  factory NotOrderedProduct.fromJson(Map<String, dynamic> json) => NotOrderedProduct(
    notOrderedProducts: List<NotOrderedProductElement>.from(json["not_ordered_products"].map((x) => NotOrderedProductElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "not_ordered_products": List<dynamic>.from(notOrderedProducts.map((x) => x.toJson())),
  };
}

class NotOrderedProductElement {
  NotOrderedProductElement({
    required this.sellerId,
    required this.orders,
    required this.seller,
  });

  String sellerId;
  List<Order> orders;
  Seller? seller;

  factory NotOrderedProductElement.fromJson(Map<String, dynamic> json) => NotOrderedProductElement(
    sellerId: json["seller_id"],
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
    seller:json["seller"]==null?null: Seller.fromJson(json["seller"]),
  );

  Map<String, dynamic> toJson() => {
    "seller_id": sellerId,
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    "seller": seller!.toJson(),
  };
}

class Order {
  Order({
    required this.orderproductId,
    required this.productId,
    required this.nameTm,
    required this.nameRu,
    required this.bodyTm,
    required this.bodyRu,
    required this.image,
    required this.quantity,
    required this.isSelected,
    required this.sellerId,
    required this.productColor,
    required this.size,
    required this.price,
    required this.priceOld,
    required this.totalPrice,
    required this.productSizeId,
    required this.productsizes,
  });

  String orderproductId;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String image;
  int quantity;
  bool isSelected;
  String sellerId;
  List<ProductColor>? productColor;
  String size;
  double price;
  int priceOld;
  double totalPrice;
  String productSizeId;
  List<Productsize>? productsizes;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderproductId: json["orderproduct_id"],
    productId: json["product_id"],
    nameTm: json["name_tm"],
    nameRu: json["name_ru"],
    bodyTm: json["body_tm"],
    bodyRu: json["body_ru"],
    image: json["image"],
    quantity: json["quantity"],
    isSelected: json["isSelected"],
    sellerId: json["seller_id"],
    productColor:json["product_color"]==null?null: List<ProductColor>.from(json["product_color"].map((x) => ProductColor.fromJson(x))),
    size: json["size"],
    price: json["price"].toDouble(),
    priceOld: json["price_old"],
    totalPrice: json["total_price"].toDouble(),
    productSizeId: json["product_size_id"],
    productsizes:json["productsizes"]==null?null: List<Productsize>.from(json["productsizes"].map((x) => Productsize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orderproduct_id": orderproductId,
    "product_id": productId,
    "name_tm": nameTm,
    "name_ru": nameRu,
    "body_tm": bodyTm,
    "body_ru": bodyRu,
    "image": image,
    "quantity": quantity,
    "isSelected": isSelected,
    "seller_id": sellerId,
    "product_color": List<dynamic>.from(productColor!.map((x) => x.toJson())),
    "size": size,
    "price": price,
    "price_old": priceOld,
    "total_price": totalPrice,
    "product_size_id": productSizeId,
    "productsizes": List<dynamic>.from(productsizes!.map((x) => x.toJson())),
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
    required this.productSizes,
    required this.productImages,
  });

  int id;
  String productColorId;
  int productId;
  String colorNameTm;
  String colorNameRu;
  DateTime createdAt;
  DateTime updatedAt;
  List<Productsize> productSizes;
  List<ProductImage> productImages;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
    id: json["id"],
    productColorId: json["product_color_id"],
    productId: json["productId"],
    colorNameTm: json["color_name_tm"],
    colorNameRu: json["color_name_ru"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    productSizes: List<Productsize>.from(json["product_sizes"].map((x) => Productsize.fromJson(x))),
    productImages: List<ProductImage>.from(json["product_images"].map((x) => ProductImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_color_id": productColorId,
    "productId": productId,
    "color_name_tm": colorNameTm,
    "color_name_ru": colorNameRu,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "product_sizes": List<dynamic>.from(productSizes.map((x) => x.toJson())),
    "product_images": List<dynamic>.from(productImages.map((x) => x.toJson())),
  };
}

class ProductImage {
  ProductImage({
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

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
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

class Productsize {
  Productsize({
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
  int productColorId;
  String size;
  double price;
  int priceOld;
  dynamic priceTm;
  dynamic priceTmOld;
  dynamic priceUsd;
  dynamic priceUsdOld;
  int discount;
  DateTime createdAt;
  DateTime updatedAt;

  factory Productsize.fromJson(Map<String, dynamic> json) => Productsize(
    id: json["id"],
    productSizeId: json["product_size_id"],
    productId: json["productId"],
    productColorId: json["productColorId"],
    size: json["size"],
    price: json["price"].toDouble(),
    priceOld: json["price_old"],
    priceTm: json["price_tm"],
    priceTmOld: json["price_tm_old"],
    priceUsd: json["price_usd"],
    priceUsdOld: json["price_usd_old"],
    discount: json["discount"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
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
