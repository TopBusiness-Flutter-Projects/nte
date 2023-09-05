class AllPlacesModel {
  List<AllPlacesModelData> data;
  String message;
  int code;

  AllPlacesModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory AllPlacesModel.fromJson(Map<String, dynamic> json) => AllPlacesModel(
        data: List<AllPlacesModelData>.from(
            json["data"].map((x) => AllPlacesModelData.fromJson(x))),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "code": code,
      };
}

class AllPlacesModelData {
  int id;
  String name;
  String lat;
  String lang;

  AllPlacesModelData({
    required this.id,
    required this.name,
    required this.lat,
    required this.lang,
  });

  factory AllPlacesModelData.fromJson(Map<String, dynamic> json) =>
      AllPlacesModelData(
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
