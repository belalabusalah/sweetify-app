import 'dart:convert';

import 'package:http/http.dart' as http;

class ProfileService {

  String baseUrl = "https://tullana.toldpath.com/api";

  Future<Map<String, dynamic>?> getProfile({
    required String token,
  }) async {

    try {

      final response = await http.get(
        Uri.parse("$baseUrl/customer/profile/info"),
        headers: {
          "Authorization": "Bearer $token",
          // "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {

        return jsonDecode(response.body);

      } else {

        print(response.body);
        return null;
      }

    } catch (e) {

      print(e);
      return null;
    }
  }
}