import 'dart:convert';
import 'package:AURA/%20services/address_services.dart';
import 'package:http/http.dart' as http;
import 'package:AURA/model/privacy_policy_model.dart';


class PrivacyPolicyServices {

  Future<PrivacyPolicyModel> getPrivacyPolicy() async {
    final response = await http.get(
      Uri.parse("${ApiConfig.baseUrl}/customer/profile/help-center/privacy-policy"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return PrivacyPolicyModel.fromJson(jsonData);
    } else {
      throw Exception("Failed To Load Privacy Policy Data");
    }
  }
}