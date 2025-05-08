import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static final SharedPrefsService _instance = SharedPrefsService._internal();
  SharedPrefsService._internal() {
    _init();
  }

  static SharedPrefsService get instance => _instance;

  late SharedPreferences _prefs;

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setValue(String key, dynamic value) async {
    if (value is String) {
      return _prefs.setString(key, value);
    } else if (value is int) {
      return _prefs.setInt(key, value);
    } else if (value is bool) {
      return _prefs.setBool(key, value);
    } else if (value is double) {
      return _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return _prefs.setStringList(key, value);
    } else {
      throw Exception('Unsupported value type');
    }
  }

  /// Получение значения с типом по умолчанию
  dynamic getValue(String key) {
    return _prefs.get(key); // Вернёт значение любого типа (String, int и т.д.)
  }

  /// Удалить по ключу
  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }

  /// Очистить всё
  Future<bool> clear() async {
    return _prefs.clear();
  }
}