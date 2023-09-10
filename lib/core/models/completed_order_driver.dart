import 'package:nte/core/models/ordersmodel.dart';

class CompletedOrderDriver {
  CompletedOrderDriverData data;
  String message;
  int code;

  CompletedOrderDriver({
    required this.data,
    required this.message,
    required this.code,
  });

  factory CompletedOrderDriver.fromJson(Map<String, dynamic> json) =>
      CompletedOrderDriver(
        data: CompletedOrderDriverData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "code": code,
      };
}

class CompletedOrderDriverData {
  List<OrdersCompletedPayment> ordersCompletedPayment;

  CompletedOrderDriverData({
    required this.ordersCompletedPayment,
  });

  factory CompletedOrderDriverData.fromJson(Map<String, dynamic> json) =>
      CompletedOrderDriverData(
        ordersCompletedPayment: List<OrdersCompletedPayment>.from(
            json["ordersCompletedPayment"]
                .map((x) => OrdersCompletedPayment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ordersCompletedPayment":
            List<dynamic>.from(ordersCompletedPayment.map((x) => x.toJson())),
      };
}

class OrdersCompletedPayment {
  int id;
  String image;
  String type;
  Warehouse fromWarehouse;
  Warehouse toWarehouse;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  OrdersCompletedPayment({
    required this.id,
    required this.image,
    required this.type,
    required this.fromWarehouse,
    required this.toWarehouse,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrdersCompletedPayment.fromJson(Map<String, dynamic> json) =>
      OrdersCompletedPayment(
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
