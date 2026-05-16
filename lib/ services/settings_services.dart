import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsServices extends GetxService {
  SharedPreferences? _sharedprefe;

  SharedPreferences get _prefs {
    if (_sharedprefe == null) {
      throw Exception("SettingsServices not initialized!");
    }
    return _sharedprefe!;
  }


  Future<SettingsServices> initSharedPreferences() async {
    _sharedprefe = await SharedPreferences.getInstance();
    return this;
  }

  // =============== TOKEN ====================
  Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  String? getToken() {
    return _prefs.getString('token');
  }

  Future<void> removeToken() async {
    await _prefs.remove('token');
  }

  // =============== LANGUAGE ====================
  Future<void> saveLang(String lang) async {
    await _prefs.setString('lang', lang);
  }

  String? getLang() {
    return _prefs.getString('lang');
  }

  // =============== CLEAR ====================
  Future<void> clear() async {
    await _prefs.clear();
  }
}
