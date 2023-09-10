class DriverOrderDetails {
  DriverOrderDetailsData data;
  String message;
  int code;

  DriverOrderDetails({
    required this.data,
    required this.message,
    required this.code,
  });

  factory DriverOrderDetails.fromJson(Map<String, dynamic> json) =>
      DriverOrderDetails(
        data: DriverOrderDetailsData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "code": code,
      };
}

class DriverOrderDetailsData {
  int id;
  String status;
  String image;
  Warehouse fromWarehouse;
  Warehouse toWarehouse;
  dynamic weight;
  dynamic quantity;
  dynamic value;
  String type;
  String description;
  ArrivalInformation? arrivalInformation;
  DateTime createdAt;
  DateTime updatedAt;

  DriverOrderDetailsData({
    required this.id,
    required this.status,
    required this.image,
    required this.fromWarehouse,
    required this.toWarehouse,
    required this.weight,
    required this.quantity,
    required this.value,
    required this.type,
    required this.description,
    this.arrivalInformation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DriverOrderDetailsData.fromJson(Map<String, dynamic> json) =>
      DriverOrderDetailsData(
        id: json["id"],
        status: json["status"],
        image: json["image"],
        fromWarehouse: Warehouse.fromJson(json["from_warehouse"]),
        toWarehouse: Warehouse.fromJson(json["to_warehouse"]),
        weight: json["weight"],
        quantity: json["quantity"],
        value: json["value"],
        type: json["type"],
        description: json["description"],
        arrivalInformation: json["arrival-information"] != null
            ? ArrivalInformation.fromJson(json["arrival-information"])
            : null,
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
        "description": description,
        "arrival-information": arrivalInformation!.toJson(),
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
      };
}

class ArrivalInformation {
  int price;
  DateTime dateArrival;

  ArrivalInformation({
    required this.price,
    required this.dateArrival,
  });

  factory ArrivalInformation.fromJson(Map<String, dynamic> json) =>
      ArrivalInformation(
        price: json["price"],
        dateArrival: DateTime.parse(json["date-arrival"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
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
