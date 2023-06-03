// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    required this.address,
    required this.userId,
  });

  String address;
  int userId;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    address: json["address"] == null ? null : json["address"],
    userId: json["userId"] == null ? null : json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "address": address == null ? null : address,
    "userId": userId == null ? null : userId,
  };
}
