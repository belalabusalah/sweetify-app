import 'package:AURA/%20services/reset_password_services.dart';
import 'package:AURA/view/app_routes/route_paths.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordServices services;
  ResetPasswordController(this.services);

  RxBool isLoading = false.obs;

  Future<void> updatePassword({
    required String email,
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    try {
      isLoading.value = true;
      final response = await services.resetPassword(
        email: email,
        token: token,
        password: password,
        confirmPassword: confirmPassword,
      );

      if (response["status"] == "password_reset") {
        Get.snackbar("Success", response["message"] ?? "Password changed successfully");
        // الانتقال لشاشة تسجيل الدخول بعد النجاح
        Get.offAllNamed(RoutePaths.signInScreen);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading.value = false;
    }
  }
}