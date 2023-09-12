class ConditionsAndTerms {
  ConditionsAndTermsData data;
  String message;
  int code;

  ConditionsAndTerms({
    required this.data,
    required this.message,
    required this.code,
  });

  factory ConditionsAndTerms.fromJson(Map<String, dynamic> json) =>
      ConditionsAndTerms(
        data: ConditionsAndTermsData.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "code": code,
      };
}

class ConditionsAndTermsData {
  int id;
  String conditions;

  ConditionsAndTermsData({
    required this.id,
    required this.conditions,
  });

  factory ConditionsAndTermsData.fromJson(Map<String, dynamic> json) =>
      ConditionsAndTermsData(
        id: json["id"],
        conditions: json["conditions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "conditions": conditions,
      };
}
