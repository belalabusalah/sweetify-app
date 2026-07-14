import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:AURA/model/about_us_model.dart';


class AboutUsService {

  String baseUrl ="https://tullana.toldpath.com/api";

  Future<AboutUsModel> getAboutUs() async {
    final response = await http.get(
      Uri.parse("$baseUrl/customer/profile/help-center/about-us"),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return AboutUsModel.fromJson(jsonData);
    } else {
      throw Exception("Failed To Load About Us Data");
    }
  }
}