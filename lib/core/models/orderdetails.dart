class OrderDetailsModel {
  OrderDetailsModelData? data;
  String message;
  int code;

  OrderDetailsModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        data: json["data"] == null
            ? null
            : OrderDetailsModelData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "code": code,
      };
}

class OrderDetailsModelData {
  int id;
  String status;
  String image;
  Warehouse fromWarehouse;
  Warehouse toWarehouse;
  int weight;
  int quantity;
  int value;
  String type;
  int? price;
  Driver? driver;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  OrderDetailsModelData({
    required this.id,
    required this.status,
    required this.image,
    required this.fromWarehouse,
    required this.toWarehouse,
    required this.weight,
    required this.quantity,
    required this.value,
    required this.type,
    required this.price,
    required this.driver,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderDetailsModelData.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModelData(
        id: json["id"],
        status: json["status"],
        image: json["image"],
        fromWarehouse: Warehouse.fromJson(json["from_warehouse"]),
        toWarehouse: Warehouse.fromJson(json["to_warehouse"]),
        weight: json["weight"],
        quantity: json["quantity"],
        value: json["value"],
        type: json["type"],
        price: json["price"],
        driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "image": image,
        "from_warehouse": fromWarehouse.toJson(),
        "to_warehouse": toWarehouse.toJson(),
        "weight": weight,
        "quantity": quantity,
        "value": value,
        "type": type,
        "price": price,
        "driver": driver!.toJson(),
        "description": description,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
      };
}

class Driver {
  String name;
  DateTime dateArrival;

  Driver({
    required this.name,
    required this.dateArrival,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        name: json["name"],
        dateArrival: DateTime.parse(json["date-arrival"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "date-arrival": dateArrival.toIso8601String(),
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
