import 'dart:convert';
import 'package:http/http.dart' as http;

import 'address_services.dart';

class ForgetPasswordServices {
  Future<Map<String, dynamic>> forgetPassword({required String email}) async{
    try {
      final response = await http.post(
        Uri.parse("${ApiConfig.baseUrl}/customer/auth/forgot-password"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"email": email}),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data["message"] ?? "Something went wrong");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
