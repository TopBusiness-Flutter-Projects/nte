class OrderModel {
  List<OrderModelData>? data;
  String message;
  int code;

  OrderModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: json["data"] == null
            ? null
            : List<OrderModelData>.from(
                json["data"].map((x) => OrderModelData.fromJson(x))),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "code": code,
      };
}

class OrderModelData {
  int id;
  String image;
  String type;
  Warehouse fromWarehouse;
  Warehouse toWarehouse;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  OrderModelData({
    required this.id,
    required this.image,
    required this.type,
    required this.fromWarehouse,
    required this.toWarehouse,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModelData.fromJson(Map<String, dynamic> json) => OrderModelData(
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

class Warehouse {
  int id;
  String name;
  String lat;
  String lang;

  Warehouse({
    required this.id,
    required this.name,
    required this.lat,
    required this.lang,
  });

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"],
        lat: json["lat"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lat": lat,
        "lang": lang,
      };
}
