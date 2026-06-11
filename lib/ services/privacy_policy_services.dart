import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:AURA/model/privacy_policy_model.dart';


class PrivacyPolicyServices {

  String baseUrl ="https://tullana.toldpath.com/api";

  Future<PrivacyPolicyModel> getPrivacyPolicy() async {
    final response = await http.get(
      Uri.parse("$baseUrl/customer/profile/help-center/privacy-policy"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return PrivacyPolicyModel.fromJson(jsonData);
    } else {
      throw Exception("Failed To Load Privacy Policy Data");
    }
  }
}