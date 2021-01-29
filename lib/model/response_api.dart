import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  ResponseApi({
    this.code,
    this.error,
    this.message,
    this.data,
  });

  int code;
  dynamic error;
  String message;
  String data;

  factory ResponseApi.fromJson(Map<String, dynamic> map) => ResponseApi(
        code: map["code"] ?? 0,
        error: map["error"],
        message: map["message"] ?? "",
        data: json.encode(map["data"]) ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code ?? 0,
        "error": error,
        "message": message ?? "",
        "data": data ?? "",
      };
}