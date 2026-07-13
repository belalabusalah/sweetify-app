import 'package:AURA/%20services/forget_password_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPasswordController extends GetxController {

  final ForgetPasswordServices services;
  ForgetPasswordController(this.services);
  final TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;


  Future<void> sendForgetPassword() async {

    if(emailController.text.trim().isEmpty){
      Get.snackbar(
        "Error",
        "Please enter your email",
      );
      return;
    }

    try {
      isLoading.value = true;
      final response = await services.forgetPassword(
        email: emailController.text.trim(),
      );

      if(response["status"] == "otp_sent"){
        Get.snackbar(
          "Success",
          response["message"],
        );

        // لاحقاً الانتقال لشاشة OTP

        // Get.toNamed(
        // "/verifyOtp",
        // arguments:{
        //    "email":emailController.text
        // }
        // );
      }
    }catch(e){
      Get.snackbar(
        "Error",
        e.toString(),
      );
    }finally{
      isLoading.value=false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();

  }


}