class NullModel {
  dynamic data;
  String message;
  int code;

  NullModel({
    required this.data,
    required this.message,
    required this.code,
  });

  factory NullModel.fromJson(Map<String, dynamic> json) => NullModel(
        data: json["data"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
        "code": code,
      };
}
