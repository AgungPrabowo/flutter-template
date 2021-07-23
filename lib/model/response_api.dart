import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  ResponseApi({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  String? data;

  factory ResponseApi.fromJson(Map<String, dynamic> map) => ResponseApi(
        code: map["code"] ?? 0,
        message: map["message"] ?? "",
        data: map["data"] == null ? "" : json.encode(map["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code ?? 0,
        "message": message ?? "",
        "data": data ?? "",
      };
}
