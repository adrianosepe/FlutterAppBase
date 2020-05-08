import 'package:app_base/ex_flow.dart';
import 'package:app_base/events/delegates.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStore {
	final SharedPreferences _prefs;

	@protected
	KeyValueStore(this._prefs);

	static Future<KeyValueStore> initialize() async {
		final instance = KeyValueStore(await SharedPreferences.getInstance());

		return instance;
	}

	int getInt(String key, {int defValue}) => _prefs.getInt(key) ?? defValue;
	bool getBool(String key, {bool defValue}) => _prefs.getBool(key) ?? defValue;
	double getDouble(String key, {double defValue}) => _prefs.getDouble(key) ?? defValue;
	String getString(String key, {String defValue}) => _prefs.getString(key) ?? defValue;
	List<String> getStringList(String key, {List defValue}) => _prefs.getStringList(key) ?? defValue;
	DateTime getDateTime(String key, {DateTime defValue}) {
		final v = _prefs.getString(key);
	  return v != null ? DateTime.tryParse(v) ?? defValue : defValue;
	}

	void setInt(String key, int value) => _prefs.setInt(key, value);
	void setBool(String key, bool value) => _prefs.setBool(key, value);
	void setDouble(String key, double value) => _prefs.setDouble(key, value);
	void setString(String key, String value) => _prefs.setString(key, value);
	void setStringList(String key, List<String> value) => _prefs.setStringList(key, value);
	void setDateTime(String key, DateTime value) => _prefs.setString(key, value.toIso8601String());

	StringStoreProperty getStringProperty(String name, { String defValue}) => StringStoreProperty(this, name, defValue: defValue);
	DateTimeStoreProperty getDateTimeProperty(String name, { DateTime defValue}) => DateTimeStoreProperty(this, name, defValue: defValue);

	JsonStoreProperty<T> getJsonProperty<T>(
			String name, Func1<T, String> toJson, Func1<String, T> fromJson) => JsonStoreProperty<T>(this, name, toJson, fromJson);
}

class StringStoreProperty {
	final String name;
	final KeyValueStore _store;
	final String defValue;

	StringStoreProperty(this._store, this.name, {this.defValue});

  String get value => _store.getString(name, defValue: defValue);
  set value(String v) => _store.setString(name, v);
}

class DateTimeStoreProperty {
	final String name;
	final KeyValueStore _store;
	final DateTime defValue;

	DateTimeStoreProperty(this._store, this.name, {this.defValue});

	DateTime get value => _store.getDateTime(name, defValue: defValue);
	set value(DateTime v) => _store.setDateTime(name, v);
}

class JsonStoreProperty<T> {
	final String name;
	final KeyValueStore _store;
	final T defValue;

	final Func1<T, String> toJson;
	final Func1<String, T> fromJson;

	JsonStoreProperty(this._store, this.name, this.toJson, this.fromJson, {this.defValue});

	T get value => ExFlow.tryGet(() {
		final s = _store.getString(name);
		if (s == null) {
			return defValue;
		}

	  return fromJson(s);
	});
	set value(T v) => ExFlow.ensure(() {
		final s = toJson(v);

	  _store.setString(name, s);
	});
}