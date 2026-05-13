import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  String baseUrl="https://tullana.toldpath.com/api";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady(){

    super.onReady();
  }
  @override
  void onClose(){

    super.onClose();
  }
  Future login() async {
    if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    isLoading.value = true;

    try {
      var response = await http.post(
        Uri.parse("$baseUrl/customer/auth/login"),
        headers: {
          "Accept": "application/json",
        },
        body: {
          'email': userNameController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      var decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("Success", decodedJson['message'] ?? "Logged in");
      } else {
        Get.snackbar(
          "Error",
          decodedJson['message'] ?? decodedJson['error'] ?? "Login failed",
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
