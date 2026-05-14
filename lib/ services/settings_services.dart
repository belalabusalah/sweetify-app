import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsServices extends GetxService {
  late SharedPreferences sharedprefe;
  Future<SettingsServices> initSharedPreferences() async {
    sharedprefe = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveToken(String token) async {
    await sharedprefe.setString('token', token);
  }

  String? getToken() {
    return sharedprefe.getString('token');
  }

  Future<void> clear() async {
    await sharedprefe.clear();
  }
}
