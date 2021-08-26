import 'dart:ui';

class Keys {
  // API
  static const String BASE_URL = 'http://192.168.88.254/';
  static const String BASE_API_URL = '${BASE_URL}api/';
  static const String ASSET_URL = '${BASE_URL}public/storage/';
  static List<ItemLocal> listLocal = [
    ItemLocal("en", Locale('en', 'US')),
    ItemLocal("id", Locale('id', 'ID')),
  ];
  static const String APP_NAME = 'Your App Name';
  static const String MSG_ERROR = 'Server Error';
  static const String LANGUAGE = "LANGUAGE";
  static const String DARK_MODE = "DARK_MODE";
  static const String MOBILE_VERSION = "MOBILE_VERSION";
  static const String SHOW_UPDATE = "SHOW_UPDATE";
  static const String FACTORY_ID = "listTileNative";
}

class ItemLocal {
  String key;
  Locale locale;
  ItemLocal(this.key, this.locale);
}
