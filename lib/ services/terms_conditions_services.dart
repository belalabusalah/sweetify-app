import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sweetify_app/model/terms_conditions_model.dart';


class TermsConditionsServices {

  String baseUrl ="https://tullana.toldpath.com/api";

  Future<TermsConditionsModel> getTermsConditions() async {
    final response = await http.get(
      Uri.parse("$baseUrl/customer/profile/help-center/terms-conditions"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return TermsConditionsModel.fromJson(jsonData);
    } else {
      throw Exception("Failed To Load Terms Conditions Data");
    }
  }
}