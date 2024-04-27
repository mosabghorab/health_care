class BaseApiModel {
  BaseApiModel({
    this.status,
    this.code,
    this.message,
  });

  bool? status;
  int? code;
  String? message;

  factory BaseApiModel.fromJson(Map<String, dynamic> json) => BaseApiModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };
}
