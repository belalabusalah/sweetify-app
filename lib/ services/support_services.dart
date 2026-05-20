


import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;
import 'package:sweetify_app/%20services/settings_services.dart';
import 'package:sweetify_app/model/support_model.dart';

class SupportService {
  final String baseUrl = "https://tullana.toldpath.com/api";
  final SettingsServices _services = Get.find<SettingsServices>();

  Future<SupportTicketModel?> createTicket({
    required String issue_type,
    required String description,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/customer/technical-support/create"),
        body: {"issue_type": issue_type, "description": description},
        headers: {
          "Authorization": "Bearer ${_services.getToken()}",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SupportTicketModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {

      return null;
    }
  }
}