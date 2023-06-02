import 'dart:ui';

class Keys {
  // API
  static const String baseUrl = 'http://192.168.88.254/';
  static const String baseApiUrl = '${baseUrl}api/';
  static const String assetUrl = '${baseUrl}public/storage/';
  static List<ItemLocal> listLocal = [
    ItemLocal("en", const Locale('en', 'US')),
    ItemLocal("id", const Locale('id', 'ID')),
  ];
  static const String appName = 'Your App Name';
  static const String msgError = 'Server Error';
  static const String language = "LANGUAGE";
  static const String darkMode = "DARK_MODE";
  static const String mobileVersion = "MOBILE_VERSION";
  static const String showUpdate = "SHOW_UPDATE";
  static const String factoryId = "listTileNative";
}

class ItemLocal {
  String key;
  Locale locale;
  ItemLocal(this.key, this.locale);
}
