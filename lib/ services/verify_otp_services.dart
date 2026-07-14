import 'dart:convert';
import 'package:http/http.dart' as http;
import 'address_services.dart'; // تأكد من استيراد ملف الـ config الخاص بك إذا كان داخله

class VerifyOtpServices {

  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otpCode,
  }) async {
    try {
      final url = Uri.parse("${ApiConfig.baseUrl}/customer/auth/verify-otp");

      // إرسال الطلب كـ MultipartRequest ليتوافق مع الـ form-data المطلوب في السيرفر
      final request = http.MultipartRequest('POST', url);

      request.fields['email'] = email;
      request.fields['token'] = otpCode; // إرسال المفتاح باسم token كما يتوقعه السيرفر تماماً

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data;
      } else {
        throw Exception(data["message"] ?? "Invalid OTP Code");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}