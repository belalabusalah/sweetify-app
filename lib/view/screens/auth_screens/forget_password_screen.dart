import 'package:AURA/view/widgets/elevated_button_app_custom.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';
import 'package:AURA/view/widgets/text_form_faild_app_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller/forget_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgetPasswordController _controllerLogin = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(24.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                        child: AppText.subtitle("first step",textAlign: TextAlign.left,)),
                  ],
                ),
                SizedBox(height: 30.h),

                // Icon / Logo
                Container(
                  height: 90.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: .1),
                    shape: BoxShape.circle,
                  ),
                  child:  Icon(
                    Icons.lock_reset,
                    size: 45.r,
                    color: Color(0xFF483028),
                  ),
                ),

                 SizedBox(height: 30.h),

                //title
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF483028)
                  ),
                ),

                 SizedBox(height: 12.h),

                 // sub title
                 Text(
                  "Don't worry! Enter your email address and we will send you a link to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                ),

                 SizedBox(height: 40.h),

                // Email Field
                CustomTextFormField(
                  controller:_controllerLogin.emailController ,
                  hintText: 'example@email.com',
                  labelText: "Email Address",
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  validator: (value){
                    if(value!.isEmpty){
                      return "please enter your email";
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Icons.email_outlined) ,
                ),

                 SizedBox(height: 25.h),

                // Button
                CustomElevatedButton(
                  text: 'Send Reset password',
                  radius: 20,
                  color: Color(0xFF483028),
                  onPressed: () {
                    _controllerLogin.sendForgetPassword();
                  },
                ),
                SizedBox(height: 25.h),

                // Back Login button
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back to Login",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Color(0xFF483028)
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}