import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putListOfUrl({
    required String key,
    required List<String> value,
  }) async {
    return await sharedPreferences!.setStringList(key, value);
  }

  static List<String>? getListOfUrl({
    required String key,
  }) {
    return sharedPreferences!.getStringList(key);
  }
}
