import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sweetify_app/%20services/settings_services.dart';

class SignUpController extends GetxController {
  final SettingsServices settings = Get.find();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController agreedWithTermsController =
      TextEditingController();

  RxBool showPass = true.obs;
  RxBool isLoading = false.obs;
  String baseUrl = "https://tullana.toldpath.com/api";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    agreedWithTermsController.dispose();
    super.onClose();
  }
  void showPassword(){
    showPass.value = !showPass.value;
  }
  Future register() async {
    // Validation
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;

    try {
      var response = await http.post(
        Uri.parse("$baseUrl/customer/auth/register"),
        headers: {
          "Accept": "application/json",
          // "Content-Type": "application/json",
          },
        body: {
          'first_name': firstNameController.text.trim(),
          'last_name': lastNameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'country_code':"PS",
          'password': passwordController.text.trim(),
          'password_confirmation': confirmPasswordController.text.trim(),
          'agreed_with_terms': "true",
        },
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        String token = data['token'];
        await settings.saveToken(token);
        Get.snackbar("Success", data['message'] ?? "Account created!");
        Get.offAllNamed("/homeScreen");
      } else {
        Get.snackbar(
          "Error",
          data['message'] ?? data['error'] ?? "Registration failed",
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
