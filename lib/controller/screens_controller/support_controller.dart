


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/%20services/support_services.dart';
import 'package:sweetify_app/model/support_model.dart';

class SupportController extends GetxController {
  final SupportService _service = SupportService();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  var isLoading = false.obs;
  var ticket = Rxn<SupportTicketModel>();

  Future<void> sendTicket() async {
    try {
      isLoading.value = true;

      final result = await _service.createTicket(
        issue_type: subjectController.text.trim(),
        description: messageController.text.trim(),
      );

      if (result != null && result.status == true) {

        Get.snackbar(
          "Success",
          "Ticket sent successfully ",
          snackPosition: SnackPosition.TOP,
        );

      } else {
        Get.snackbar(
          "Error",
          "Failed to send ticket",
          snackPosition: SnackPosition.TOP,
        );
      }

    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong",
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;

    }
  }
}