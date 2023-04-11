// To parse this JSON data, do
//
//     final addressGet = addressGetFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddressGet addressGetFromJson(String str) => AddressGet.fromJson(json.decode(str));

String addressGetToJson(AddressGet data) => json.encode(data.toJson());

class AddressGet {
  AddressGet({
    required this.address,
  });

  List<Address>? address;

  factory AddressGet.fromJson(Map<String, dynamic> json) => AddressGet(
    address: json["address"] == null ? null : List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "address": address == null ? null : List<dynamic>.from(address!.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    required this.id,
    required this.addressId,
    required this.welayat,
    required this.address,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String addressId;
  String welayat;
  String address;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"] == null ? null : json["id"],
    addressId: json["address_id"] == null ? null : json["address_id"],
    welayat: json["welayat"] == null ? null : json["welayat"],
    address: json["address"] == null ? null : json["address"],
    userId: json["userId"] == null ? null : json["userId"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "address_id": addressId == null ? null : addressId,
    "welayat": welayat == null ? null : welayat,
    "address": address == null ? null : address,
    "userId": userId == null ? null : userId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
