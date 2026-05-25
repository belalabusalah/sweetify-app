import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sweetify_app/%20services/settings_services.dart';

class SignInController extends GetxController {
  final SettingsServices settings = Get.find();
  RxBool showPass = true.obs;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
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
  void showPassword(){
    showPass.value = !showPass.value;
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

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        String token = data['token'];
        await settings.saveToken(token);
        Get.snackbar(
          "Success",
          data['message'] ?? "Logged in successfully",
        );
        Get.offAllNamed("/mainScreen");
      } else {
        Get.snackbar(
          "Error",
          data['message'] ?? data['error'] ?? "Login failed",
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
