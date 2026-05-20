import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sweetify_app/%20services/settings_services.dart';
import '../model/address_model.dart';

class GetAddressListService {
  final SettingsServices _services = Get.find<SettingsServices>();

  // ─── GET list ────────────────────────────────────────────────────────────

  Future<AddressListModel?> getAddressList() async {
    try {
      final token = _services.getToken();
      if (token == null) {
        print('[Address] TOKEN IS NULL');
        return null;
      }
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/customer/profile/address/list'),
        headers: ApiConfig.headers(token),
      );
      print('[Address] GET list → ${response.statusCode}: ${response.body}');
      if (response.statusCode == 200) {
        return AddressListModel.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      print('[Address] GET list ERROR: $e');
      return null;
    }
  }

  // ─── POST add address ────────────────────────────────────────────────────────────

  Future<String?> addAddress(Map<String, dynamic> data) async {
    try {
      final token = _services.getToken();
      if (token == null) return 'Authentication required. Please login again.';

      final Map<String, dynamic> body = {};
      data.forEach((k, v) {
        if (v != null) body[k] = v;
      });

      print('[Address] POST add → body: $body');
      body.forEach((k, v) => print('[Address]   $k: (${v.runtimeType}) = $v'));

      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/customer/profile/address/add'),
        headers: ApiConfig.headers(token),
        body: jsonEncode(body),
      );

      print('[Address] POST add RESPONSE ${response.statusCode}: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null; // success
      }
      return _extractError(response.body, response.statusCode);
    } catch (e) {
      print('[Address] POST add EXCEPTION: $e');
      return e.toString();
    }
  }

  // ─── PUT update address ──────────────────────────────────────────────────────────

  Future<String?> updateAddress(int id, Map<String, dynamic> data) async {
    try {
      final token = _services.getToken();
      if (token == null) return 'Authentication required. Please login again.';

      final Map<String, dynamic> body = {'id': id};
      data.forEach((k, v) {
        if (v != null) body[k] = v;
      });

      print('[Address] PUT update → body: $body');
      body.forEach((k, v) => print('[Address]   $k: (${v.runtimeType}) = $v'));

      final response = await http.put(
        Uri.parse('${ApiConfig.baseUrl}/customer/profile/address/update'),
        headers: ApiConfig.headers(token),
        body: jsonEncode(body),
      );

      print('[Address] PUT update RESPONSE ${response.statusCode}: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return null; // success
      }
      return _extractError(response.body, response.statusCode);
    } catch (e) {
      print('[Address] PUT update EXCEPTION: $e');
      return e.toString();
    }
  }

  // ─── Helper ──────────────────────────────────────────────────────────────

  String _extractError(String body, int statusCode) {
    try {
      final json = jsonDecode(body);
      if (json is Map<String, dynamic>) {
        // Common API error shapes
        if (json['message'] != null) return json['message'].toString();
        if (json['error'] != null)   return json['error'].toString();
        if (json['msg'] != null)     return json['msg'].toString();
        if (json['errors'] != null) {
          final errors = json['errors'];
          if (errors is Map && errors.isNotEmpty) {
            final first = errors.values.first;
            return first is List ? first.first.toString() : first.toString();
          }
          if (errors is List && errors.isNotEmpty) {
            return errors.first.toString();
          }
        }
      }
    } catch (_) {}
    return 'Server error (HTTP $statusCode)';
  }
}

// ─── ApiConfig ───────────────────────────────────────────────────────────────

class ApiConfig {
  static const String baseUrl = 'https://tullana.toldpath.com/api';

  static Map<String, String> headers(String token) => {
        'Authorization': 'Bearer $token',
    "Content-Type": "application/json",
    "Accept": "application/json",
      };
}
