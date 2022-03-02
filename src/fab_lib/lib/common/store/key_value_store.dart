part of fab_lib;

class KeyValueStore {
  final SharedPreferences _prefs;

  @protected
  KeyValueStore(this._prefs);

  static Future<KeyValueStore> initialize() async {
    final instance = KeyValueStore(await SharedPreferences.getInstance());

    return instance;
  }

  int? getInt(String key, {int? defValue}) => _prefs.getInt(key) ?? defValue;
  bool? getBool(String key, {bool? defValue}) => _prefs.getBool(key) ?? defValue;
  double? getDouble(String key, {double? defValue}) => _prefs.getDouble(key) ?? defValue;
  String? getString(String key, {String? defValue}) => _prefs.getString(key) ?? defValue;
  List<String>? getStringList(String key, {List<String>? defValue}) => _prefs.getStringList(key) ?? defValue;
  DateTime? getDateTime(String key, {DateTime? defValue}) {
    final v = _prefs.getString(key);
    return v != null ? DateTime.tryParse(v) ?? defValue : defValue;
  }

  void setInt(String key, int value) => _prefs.setInt(key, value);
  void setBool(String key, bool value) => _prefs.setBool(key, value);
  void setDouble(String key, double value) => _prefs.setDouble(key, value);
  void setString(String key, String value) => _prefs.setString(key, value);
  void setStringList(String key, List<String> value) => _prefs.setStringList(key, value);
  void setDateTime(String key, DateTime value) => _prefs.setString(key, value.toIso8601String());

  StringStoreProperty getStringProperty(String name, {String? defValue}) => StringStoreProperty(this, name, defValue: defValue);
  DateTimeStoreProperty getDateTimeProperty(String name, {DateTime? defValue}) => DateTimeStoreProperty(this, name, defValue: defValue);

  JsonStoreProperty<T> getJsonProperty<T>(String name, Func1<T, String> toJson, Func1<String?, T?> fromJson) => JsonStoreProperty<T>(this, name, toJson, fromJson);
}
