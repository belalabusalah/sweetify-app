import 'dart:convert';
import 'package:http/http.dart' as http;
import 'address_services.dart';

class ResetPasswordServices {

  Future<Map<String, dynamic>> resetPassword({
    required String email,
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final url = Uri.parse("${ApiConfig.baseUrl}/customer/auth/reset-password");

      final response = await http.put(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "token": token,
          "password": password,
          "confirm_password": confirmPassword,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data["message"] ?? "Failed to reset password");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}