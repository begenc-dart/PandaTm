// To parse this JSON data, do
//
//     final bannerProdcut = bannerProdcutFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Is_Order_Model bannerProdcutFromJson(String str) => Is_Order_Model.fromJson(json.decode(str));

String bannerProdcutToJson(Is_Order_Model data) => json.encode(data.toJson());

class Is_Order_Model {
  Is_Order_Model({
    required this.status,
    required this.orderProduct,
  });

  int status;
  OrderProduct? orderProduct;

  factory Is_Order_Model.fromJson(Map<String, dynamic> json) => Is_Order_Model(
    status: json["status"] == null ? null : json["status"],
    orderProduct:  json["order_product"]==null?null:OrderProduct.fromJson(json["order_product"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "order_product": orderProduct == null ? null : orderProduct!.toJson(),
  };
}

class OrderProduct {
  OrderProduct({
    required this.id,
    required this.orderproductId,
    required this.orderId,
    required this.productId,
    required this.productSizeId,
    required this.userId,
    required this.sellerId,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.image,
    required this.isSelected,
    required this.isOrdered,
    required this.status,
    required this.size,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String orderproductId;
  dynamic orderId;
  String productId;
  String? productSizeId;
  int userId;
  String? sellerId;
  int quantity;
  double price;
  double totalPrice;
  String image;
  bool isSelected;
  bool isOrdered;
  String status;
  String size;
  DateTime createdAt;
  DateTime updatedAt;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
    id: json["id"] == null ? null : json["id"],
    orderproductId: json["orderproduct_id"] == null ? null : json["orderproduct_id"],
    orderId: json["orderId"],
    productId: json["product_id"] == null ? null : json["product_id"],
    productSizeId: json["product_size_id"] == null ? null : json["product_size_id"],
    userId: json["userId"] == null ? null : json["userId"],
    sellerId: json["seller_id"] == null ? null : json["seller_id"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    totalPrice: json["total_price"] == null ? null : json["total_price"].toDouble(),
    image: json["image"] == null ? null : json["image"],
    isSelected: json["isSelected"] == null ? null : json["isSelected"],
    isOrdered: json["is_ordered"] == null ? null : json["is_ordered"],
    status: json["status"] == null ? null : json["status"],
    size: json["size"] == null ? null : json["size"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "orderproduct_id": orderproductId == null ? null : orderproductId,
    "orderId": orderId,
    "product_id": productId == null ? null : productId,
    "product_size_id": productSizeId == null ? null : productSizeId,
    "userId": userId == null ? null : userId,
    "seller_id": sellerId == null ? null : sellerId,
    "quantity": quantity == null ? null : quantity,
    "price": price == null ? null : price,
    "total_price": totalPrice == null ? null : totalPrice,
    "image": image == null ? null : image,
    "isSelected": isSelected == null ? null : isSelected,
    "is_ordered": isOrdered == null ? null : isOrdered,
    "status": status == null ? null : status,
    "size": size == null ? null : size,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
