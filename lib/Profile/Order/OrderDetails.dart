// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
  OrderDetails({
    required this.orders,
    required this.count,
  });

  List<OrderDetailsOrder> orders;
  int count;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    orders:  List<OrderDetailsOrder>.from(json["orders"].map((x) => OrderDetailsOrder.fromJson(x))),
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "orders": orders == null ? null : List<dynamic>.from(orders.map((x) => x.toJson())),
    "count": count == null ? null : count,
  };
}

class OrderDetailsOrder {
  OrderDetailsOrder({
    required this.date,
    required this.orders,
  });

  DateTime date;
  List<OrderOrder> orders;

  factory OrderDetailsOrder.fromJson(Map<String, dynamic> json) => OrderDetailsOrder(
    date:  DateTime.parse(json["date"]),
    orders:  List<OrderOrder>.from(json["orders"].map((x) => OrderOrder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date.toIso8601String(),
    "orders": orders == null ? null : List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class OrderOrder {
  OrderOrder({
    required this.orderproductId,
    required this.productId,
    required this.nameTm,
    required this.nameRu,
    required this.bodyTm,
    required this.bodyRu,
    required this.image,
    required this.quantity,
    required this.createdAt,
    required this.status,
    required this.price,
    required this.priceOld,
    required this.totalPrice,
  });

  String orderproductId;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String image;
  int quantity;
  DateTime createdAt;
  String status;
  double? price;
  double? priceOld;
  double? totalPrice;

  factory OrderOrder.fromJson(Map<String, dynamic> json) => OrderOrder(
    orderproductId: json["orderproduct_id"] == null ? null : json["orderproduct_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    bodyTm: json["body_tm"] == null ? null : json["body_tm"],
    bodyRu: json["body_ru"] == null ? null : json["body_ru"],
    image: json["image"] == null ? null : json["image"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    createdAt:DateTime.parse(json["createdAt"]),
    status: json["status"] == null ? null : json["status"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    priceOld: json["price_old"] == null ? null : json["price_old"].toDouble(),
    totalPrice: json["total_price"] == null ? null : json["total_price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "orderproduct_id": orderproductId == null ? null : orderproductId,
    "product_id": productId == null ? null : productId,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "body_tm": bodyTm == null ? null : bodyTm,
    "body_ru": bodyRu == null ? null : bodyRu,
    "image": image == null ? null : image,
    "quantity": quantity == null ? null : quantity,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "status": status == null ? null : status,
    "price": price == null ? null : price,
    "price_old": priceOld == null ? null : priceOld,
    "total_price": totalPrice == null ? null : totalPrice,
  };
}
