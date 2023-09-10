import 'ordersmodel.dart';

class AllOrdersDriversModel {
  AllOrdersDriversModelData data;
  String message;
  int code;

  AllOrdersDriversModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory AllOrdersDriversModel.fromJson(Map<String, dynamic> json) =>
      AllOrdersDriversModel(
        data: AllOrdersDriversModelData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "code": code,
      };
}

class AllOrdersDriversModelData {
  List<Order> orders;
  AllOrdersDriversModelData({
    required this.orders,
  });

  factory AllOrdersDriversModelData.fromJson(Map<String, dynamic> json) =>
      AllOrdersDriversModelData(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  int id;
  String image;
  String type;
  Warehouse fromWarehouse;
  Warehouse toWarehouse;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Order({
    required this.id,
    required this.image,
    required this.type,
    required this.fromWarehouse,
    required this.toWarehouse,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        image: json["image"],
        type: json["type"],
        fromWarehouse: Warehouse.fromJson(json["from_warehouse"]),
        toWarehouse: Warehouse.fromJson(json["to_warehouse"]),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "type": type,
        "from_warehouse": fromWarehouse.toJson(),
        "to_warehouse": toWarehouse.toJson(),
        "status": status,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
      };
}
