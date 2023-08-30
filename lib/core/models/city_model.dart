class Cities {
  List<CityData> data;
  String message;
  int code;

  Cities({
    required this.data,
    required this.message,
    required this.code,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        data:
            List<CityData>.from(json["data"].map((x) => CityData.fromJson(x))),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "code": code,
      };
}

class CityData {
  int id;
  String name;

  CityData({
    required this.id,
    required this.name,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
