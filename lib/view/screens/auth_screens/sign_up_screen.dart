import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/auth_controller/sign_up_controller.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_form_faild_app_custom.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController _signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 27.h),

              AppText.body("Create an Account",fontSize: 24.sp,fontWeight: FontWeight.w600,),
              SizedBox(height: 40.h),

              CustomTextFormField(
                controller: _signUpController.firstNameController,
                prefixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: const Color(0xFF8C8C90),
                  size: 24.r,
                ),
                hintText: "first name",
              ),
              SizedBox(height: 20.h),

              CustomTextFormField(
                controller: _signUpController.lastNameController,
                prefixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: const Color(0xFF8C8C90),
                  size: 24.r,
                ),
                hintText: "last name",
              ),
              SizedBox(height: 20.h),

              CustomTextFormField(
                controller: _signUpController.emailController,
                prefixIcon: Icon(
                  Icons.person,
                  color: const Color(0xFF8C8C90),
                  size: 24.r,
                ),
                hintText: "Username or Email",
              ),
              SizedBox(height: 20.h),

              CustomTextFormField(
                controller: _signUpController.phoneController,
                prefixIcon: Icon(
                  Icons.phone,
                  color: const Color(0xFF8C8C90),
                  size: 24.r,
                ),
                hintText: "phone",
              ),
              SizedBox(height: 20.h),

              Obx(()=>CustomTextFormField(
                obscureText: _signUpController.showPass.value,
                controller: _signUpController.passwordController,
                prefixIcon: Icon(
                  Icons.lock,
                  color: const Color(0xFF8C8C90),
                  size: 24.r,
                ),
                hintText: "Password",
                suffixIcon: IconButton(
                  icon: Icon(_signUpController.showPass.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,size: 24.r,),
                  onPressed: (){
                    _signUpController.showPassword();
                  },
                  color: const Color(0xFF8C8C90),

                ),

              ),),
              SizedBox(height: 20.h),

              CustomTextFormField(
                obscureText: true,
                controller: _signUpController.confirmPasswordController,
                prefixIcon: Icon(
                  Icons.lock,
                  color: const Color(0xFF8C8C90),
                  size: 24.r,

                ),
                hintText: "Confirm Password",
                suffixIcon: Icon(
                    _signUpController.showPass.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  color: const Color(0xFF8C8C90),
                  size: 24.r,
                ),
              ),
              SizedBox(height: 20.h),

              Wrap(
                children: [
                  AppText.caption(
                    "By clicking the  ",
                    color: const Color(0xFFA99577),
                    textAlign: TextAlign.center,
                  ),
                  AppText.caption(
                    "Create Account",
                    color: const Color(0xFFC99206),
                    textAlign: TextAlign.center,
                  ),
                  AppText.caption(
                    "button, you agree ",
                    color: const Color(0xFFA99577),
                    textAlign: TextAlign.center,
                  ),
                  AppText.caption(
                    " to the public offer",
                    color: const Color(0xFFA99577),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 30.h),

              Obx(() {
                return _signUpController.isLoading.value
                    ? const CircularProgressIndicator()
                    : CustomElevatedButton(
                  text: 'Create Account',
                  onPressed: () {
                    _signUpController.register();
                  },
                  color: const Color(0xFF483028),
                );
              }),
              SizedBox(height: 30.h),

              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: const Text(
                      "Or Continue With",
                      style: TextStyle(fontSize: 12, color: Color(0xFFA99577)),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
              SizedBox(height: 20.h),

              // social icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/auth_images/google.png"),
                  SizedBox(width: 16.w),
                  Image.asset("images/auth_images/apple.png"),
                  SizedBox(width: 16.w),
                  Image.asset("images/auth_images/faceboock.png"),
                ],
              ),
              SizedBox(height: 32.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.caption(
                    "I Already Have an Account",
                    color: const Color(0xFFA99577),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: AppText.caption("Sign In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}