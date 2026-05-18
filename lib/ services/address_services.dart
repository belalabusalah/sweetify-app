


import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sweetify_app/%20services/settings_services.dart';
import '../model/address_list_model.dart';

class GetAddressListService {

  final SettingsServices _services = Get.find<SettingsServices>();

  Future<AddressListModel?> getAddressList() async {
    try {
      final token =_services.getToken();

      if (token == null) {
        print("TOKEN IS NULL");
        return null;
      }
      final response = await http.get(
        Uri.parse("${ApiConfig.baseUrl}/customer/profile/address/list"),
        headers: ApiConfig.headers(token),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return AddressListModel.fromJson(data);
      }

      return null;
    } catch (e) {
      print("GET ADDRESS ERROR: $e");
      return null;
    }
  }
}

class ApiConfig {
  static const String baseUrl = "https://tullana.toldpath.com/api";

  static Map<String, String> headers(String token) {
    return {
      // "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }
}
