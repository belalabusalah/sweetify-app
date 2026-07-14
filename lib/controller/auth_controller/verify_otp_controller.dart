import 'package:AURA/%20services/verify_otp_services.dart';
import 'package:AURA/view/app_routes/route_paths.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final VerifyOtpServices services;
  VerifyOtpController(this.services);

  RxBool isLoading = false.obs;

  Future<void> confirmOtp({required String email, required String otpCode}) async {
    try {
      isLoading.value = true;

      final response = await services.verifyOtp(
        email: email,
        otpCode: otpCode,
      );

      // التحقق من الـ status الصحيحة القادمة من السيرفر وهي otp_verified
      if (response["status"] == "otp_verified") {
        Get.snackbar(
          "Success",
          response["message"] ?? "Step 2 complete. Code verified successfully.",
        );

        // التوجيه إلى شاشة تعيين كلمة المرور الجديدة مع تمرير الإيميل والـ token
        Get.toNamed(
          RoutePaths.resetPasswordScreen, // قمنا بتعديلها لتذهب لـ resetPasswordScreen بدلاً من verifyOtpScreen نفسه
          arguments: {
            "email": email,
            "token": otpCode,
          },
        );
      } else {
        Get.snackbar(
          "Error",
          response["message"] ?? "Verification failed",
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString().replaceAll("Exception: ", ""), // تنظيف نص الخطأ ليظهر بشكل مناسب للمستخدم
      );
    } finally {
      isLoading.value = false;
    }
  }
}