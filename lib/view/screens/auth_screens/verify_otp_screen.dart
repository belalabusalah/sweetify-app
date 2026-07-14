import 'dart:async';
import 'package:AURA/%20services/verify_otp_services.dart';
import 'package:AURA/controller/auth_controller/verify_otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // حل مشكلة شاشة الموت الحمراء: نقوم بحقن الـ Controller والـ Services مباشرة هنا لضمان وجودها في الذاكرة
  final VerifyOtpController _otpController = Get.put(
    VerifyOtpController(VerifyOtpServices()),
  );

  final String email = Get.arguments?['email'] ?? 'your email';
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  int _start = 30;
  Timer? _timer;
  bool _isResendActive = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();

    _startTimer();
  }

  void _startTimer() {
    _start = 30;
    _isResendActive = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _isResendActive = true;
          _timer?.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    // حل تحذير الـ Linter بجعل جملة الـ for داخل أقواس {}
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otpCode => _controllers.map((c) => c.text).join();

  void _verifyOtp() {
    if (_otpCode.length < 4) {
      Get.snackbar("تنبيه", "الرجاء إدخال رمز التحقق كاملاً");
      return;
    }
    _otpController.confirmOtp(email: email, otpCode: _otpCode);
  }

  @override
  Widget build(BuildContext context) {
    const Color brandColor = Color(0xFF4A2E2B);

    return Scaffold(
      backgroundColor: const Color(0xFFFCF8F8),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFCF8F8), Color(0xFFF3EBEB)],
          ),
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Icon(Icons.security_rounded, size: 80, color: brandColor),
                    const SizedBox(height: 32),
                    const Text(
                      "Verify Account",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: brandColor),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Enter the 4-digit code sent to\n$email",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 65,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: _focusNodes[index].hasFocus
                                ? [BoxShadow(color: brandColor.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))]
                                : [],
                            border: Border.all(color: _focusNodes[index].hasFocus ? brandColor : Colors.grey.shade200, width: 2),
                          ),
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: brandColor),
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(counterText: "", border: InputBorder.none),
                            onChanged: (value) {
                              // حل تحذيرات الـ Linter بوضع جمل الـ if/else داخل أقواس {}
                              if (value.isNotEmpty) {
                                if (index < 3) {
                                  _focusNodes[index + 1].requestFocus();
                                } else {
                                  _focusNodes[index].unfocus();
                                  _verifyOtp();
                                }
                              } else {
                                if (index > 0) {
                                  _focusNodes[index - 1].requestFocus();
                                }
                              }
                              setState(() {});
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: Obx(() => ElevatedButton(
                        onPressed: _otpController.isLoading.value ? null : _verifyOtp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brandColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: _otpController.isLoading.value
                            ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                        )
                            : const Text("Verify Now", style: TextStyle(fontSize: 18, color: Colors.white)),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}