import 'dart:convert';

MobileVersion mobileVersionFromJson(String? str) =>
    MobileVersion.fromJson(json.decode(str ?? ""));

String mobileVersionToJson(MobileVersion data) => json.encode(data.toJson());

class MobileVersion {
  MobileVersion({
    required this.package,
    required this.whatsNew,
    required this.version,
    required this.link,
    required this.forceUpdate,
  });

  String package;
  String whatsNew;
  String version;
  String link;
  bool forceUpdate;

  factory MobileVersion.fromJson(Map<String, dynamic> json) => MobileVersion(
        package: json["package"] ?? "",
        whatsNew: json["whats_new"] ?? "",
        version: json["version"] ?? "",
        link: json["link"] ?? "",
        forceUpdate: json["force_update"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "package": package,
        "whats_new": whatsNew,
        "version": version,
        "link": link,
        "force_update": forceUpdate,
      };
}