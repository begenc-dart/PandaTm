// To parse this JSON data, do
//
//     final sellersModel = sellersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SellersModel sellersModelFromJson(String str) => SellersModel.fromJson(json.decode(str));

String sellersModelToJson(SellersModel data) => json.encode(data.toJson());

class SellersModel {
  SellersModel({
    required this.sellers,
  });

  List<Seller> sellers;

  factory SellersModel.fromJson(Map<String, dynamic> json) => SellersModel(
    sellers: List<Seller>.from(json["sellers"].map((x) => Seller.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sellers": sellers == null ? null : List<dynamic>.from(sellers.map((x) => x.toJson())),
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
  String? sellerId;
  String? phoneNumber;
  dynamic phoneNumberExtra;
  String? nameTm;
  String? nameRu;
  String? image;
  String? password;
  dynamic nickname;
  String? addressTm;
  String? addressRu;
  bool? isActive;
  DateTime createdAt;
  DateTime updatedAt;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
    id: json["id"] == null ? null : json["id"],
    sellerId: json["seller_id"] == null ? null : json["seller_id"],
    phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
    phoneNumberExtra: json["phone_number_extra"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    image: json["image"] == null ? null : json["image"],
    password: json["password"] == null ? null : json["password"],
    nickname: json["nickname"],
    addressTm: json["address_tm"] == null ? null : json["address_tm"],
    addressRu: json["address_ru"] == null ? null : json["address_ru"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "seller_id": sellerId == null ? null : sellerId,
    "phone_number": phoneNumber == null ? null : phoneNumber,
    "phone_number_extra": phoneNumberExtra,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "image": image == null ? null : image,
    "password": password == null ? null : password,
    "nickname": nickname,
    "address_tm": addressTm == null ? null : addressTm,
    "address_ru": addressRu == null ? null : addressRu,
    "isActive": isActive == null ? null : isActive,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
