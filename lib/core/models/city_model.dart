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
  String nameAr;
  String nameEn;

  CityData({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory CityData.fromJson(Map<String, dynamic> json) => CityData(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
      };
}
