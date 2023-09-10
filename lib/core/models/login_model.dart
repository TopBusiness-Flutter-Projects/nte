import 'package:nte/core/models/city_model.dart';

class LoginModel {
  Data? data;
  String? message;
  int? code;

  LoginModel({
    this.data,
    this.message,
    this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "code": code,
      };
}

class Data {
  int id;
  String name;
  String image;
  String email;
  dynamic phone;
  int nationalId;
  CityData city;
  String type;
  String? userType;
  String status;
  String token;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.nationalId,
    required this.city,
    required this.type,
    required this.userType,
    required this.status,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        email: json["email"],
        phone: json["phone"],
        nationalId: json["national_id"],
        city: CityData.fromJson(json["city"]),
        type: json["type"],
        userType: json["user_type"],
        status: json["status"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "email": email,
        "phone": phone,
        "national_id": nationalId,
        "city": city.toJson(),
        "type": type,
        "user_type": userType,
        "status": status,
        "token": token,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
      };
}
